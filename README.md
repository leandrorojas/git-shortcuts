# git-shortcuts
a series of git commands to make use of git a little bit easier

commands:
* g-
  * git reset --hard
* gb
  * list all local branches
* gb <branch_name>
  * creates a both local and remote branch
* gb -d
  * deletes all local branches but "main" and all stale branches on remote (locally)
* gc "message"
  * git add all & commit
* git-fix
  * removes and adds origin again
* gi "message"
  * sends an increment to remote
* gm
  * switches to main and pulls latest changes
* gp
  * git push
* gr <remote_branch>
  * stashes local changes, pulls <remote_branch> and applies stashed changes
* gs
  * git status
* gt <tag_name>
  * creates a new tag with <tag_name>
* gt <old_tag> <new_tag> 
  * renames a tag and pushes to remote

install
1. clone into the desired folder (suggestion $HOME/bin/git-shortcuts)

```git clone https://github.com/leandrorojas/git-shortcuts.git $HOME/bin/git-shortcuts```

2. edit your default shell profile and add the following at the end:

```export PATH="$HOME/bin/git-shortcuts/src:$PATH"```

3. verify that you are not using any aliases in your default shell profile that will conflict with the commands

Note: tested on macos

oh-my-zsh
1. comment the git plugin from ~/.zshrc
2. do not source your profile file, reload your terminal (close and open)
3. to ensure the commands are properly working use

```which gb```

it should say something like ```$HOME/bin/git-shortcuts/src/gb``` (where $HOME is your home directory)

inspiration taken from:
* https://github.com/shobhitpuri/git-refresh
* sheel styling: https://google.github.io/styleguide/shellguide.html
