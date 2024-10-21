#!/bin/bash

readonly MAIN_BRANCH="main" #TODO: read this from .config
readonly HIDDEN_FILE=".hidden"

function git_branch(){
    if [[ $# -eq 1 ]]; then
        git branch "${1}"
    else
        git branch
    fi
}

function git_branch_enum(){
    git branch | cut -c 3-
}

function git_checkout(){
    git checkout "${1}"
}

function git_commit(){
    git commit -am \""${1}"\"
}

# shellcheck disable=SC2120
function git_push(){
    if [[ $# -eq 1 ]]; then
        git push -u origin "${1}"
    else
        git push
    fi
}

function git_status(){
    git status
}

function git_add_all(){
    git add "-A"
}

function git_stash(){
    git stash
}

function git_rebase(){
    git rebase "${1}"
}

function git_pull_rebase(){
    git pull --rebase origin "${1}"
}

function git_reset(){
    git reset --hard
}

#file
function add_hidden_file(){
    git add $HIDDEN_FILE
}

function file_create_control(){
    if [ ! -f $HIDDEN_FILE ]; then
        file_create
    else
        file_remove
    fi
}

function file_create(){
    echo " " > $HIDDEN_FILE
    add_hidden_file
}

function file_remove(){
    rm $HIDDEN_FILE
}

function branch_create(){
    git_branch "${1}"
}

function branch_delete_all(){
    for to_delete in $(git_branch_enum); do
        if [[ $to_delete != "$MAIN_BRANCH" ]]; then
            git branmch -D "$to_delete"
        fi
    done

    git remote prune origin
}

function get_main(){
    git_checkout ${MAIN_BRANCH}
    git pull
}

function tag_copy(){
    git tag "${1}" "${2}"
}

function tag_delete(){
    git tag -d "${1}"
}

function tag_push_deleted(){
    git push origin :refs/tags/"${1}"
}

function tag_push_all(){
    git push --tags
}

function increment_send(){
    git_commit "${1}"
    git_push
}

function get_current_branch(){
    git symbolic-ref --short -q HEAD
}

function apply_stash(){
    git stash apply
}

function get_origin_url(){
    git ls-remote --get-url origin
}

function fix_branch_fetching(){
    for origin_url in $(get_origin_url); do
        git remote rm "${origin_url}"
        git remote add "${origin_url}"
    done

    git fetch --all
}