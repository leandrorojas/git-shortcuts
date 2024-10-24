#!/bin/bash

readonly MAIN_BRANCH="main" #TODO: read this from .config
readonly HIDDEN_FILE=".hidden"

function common::git_branch(){
    if [[ $# -eq 1 ]]; then
        git branch "${1}"
    else
        git branch
    fi
}

function common::git_branch_enum(){
    git branch | cut -c 3-
}

function common::git_checkout(){
    git checkout "${1}"
}

function common::git_commit(){
    git commit -am \""${1}"\"
}

# shellcheck disable=SC2120
function common::git_push(){
    if [[ $# -eq 1 ]]; then
        git push -u origin "${1}"
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
    git rebase "${1}"
}

function common::git_pull_rebase(){
    git pull --rebase origin "${1}"
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

function common::file_create(){
    echo " " > $HIDDEN_FILE
    add_hidden_file
}

function common::file_remove(){
    rm $HIDDEN_FILE
}

function common::branch_create(){
    git_branch "${1}"
}

function common::branch_delete_all(){
    for to_delete in $(git_branch_enum); do
        if [[ $to_delete != "$MAIN_BRANCH" ]]; then
            git branmch -D "$to_delete"
        fi
    done

    git remote prune origin
}

function common::get_main(){
    git_checkout ${MAIN_BRANCH}
    git pull
}

function common::tag_copy(){
    git tag "${1}" "${2}"
}

function common::tag_delete(){
    git tag -d "${1}"
}

function common::tag_push_deleted(){
    git push origin :refs/tags/"${1}"
}

function common::tag_push_all(){
    git push --tags
}

function common::increment_send(){
    git_commit "${1}"
    git_push
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