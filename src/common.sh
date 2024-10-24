#!/bin/bash

readonly MAIN_BRANCH="main" #TODO: read this from .config
readonly HIDDEN_FILE=".hidden"

function file_create(){
    echo " " > $HIDDEN_FILE
    add_hidden_file
}

function file_remove(){
    rm $HIDDEN_FILE
}

function common::git_branch(){
    if [[ $# -eq 1 ]]; then
        local branch_name=$1
        git branch "${branch_name}"
    else
        git branch
    fi
}

function common::git_branch_enum(){
    git branch | cut -c 3-
}

function common::git_checkout(){
    local branch_name=$1
    git checkout "${branch_name}"
}

function common::git_commit(){
    git commit -am \""${1}"\"
}

# shellcheck disable=SC2120
function common::git_push(){
    if [[ $# -eq 1 ]]; then
    local branch_name=$1
        git push -u origin "${branch_name}"
    else
        git push
    fi
}

function common::git_status(){
    git status
}

function common::git_add_all(){
    git add "-A"
}

function common::git_stash(){
    git stash
}

function common::git_rebase(){
    branch_name=$1
    git rebase "${branch_name}"
}

function common::git_pull_rebase(){
    branch_name=$1
    git pull --rebase origin "${branch_name}"
}

function common::git_reset(){
    git reset --hard
}

#file
function common::add_hidden_file(){
    git add $HIDDEN_FILE
}

function common::file_create_control(){
    if [ ! -f $HIDDEN_FILE ]; then
        file_create
    else
        file_remove
    fi
}

function common::branch_create(){
    local branch_name=$1
    common::git_branch "${branch_name}"
}

function common::branch_delete_all(){
    for to_delete in $(common::git_branch_enum); do
        if [[ $to_delete != "$MAIN_BRANCH" ]]; then
            git branmch -D "$to_delete"
        fi
    done

    git remote prune origin
}

function common::get_main(){
    common::git_checkout ${MAIN_BRANCH}
    git pull
}

function common::tag_copy(){
    local old_tag=$1
    local new_tag=$2
    git tag "${old_tag}" "${new_tag}"
}

function common::tag_delete(){
    local tag_name=$1
    git tag -d "${tag_name}"
}

function common::tag_push_deleted(){
    local tag_name=$1
    git push origin :refs/tags/"${tag_name}"
}

function common::tag_push_all(){
    git push --tags
}

function common::increment_send(){
    local commit_message=$1
    common::git_commit "${commit_message}"
    common::git_push
}

function common::get_current_branch(){
    git symbolic-ref --short -q HEAD
}

function common::apply_stash(){
    git stash apply
}

function common::get_origin_url(){
    git ls-remote --get-url origin
}

function common::fix_branch_fetching(){
    for origin_url in $(get_origin_url); do
        git remote rm "${origin_url}"
        git remote add "${origin_url}"
    done

    git fetch --all
}