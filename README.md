# git-shortcuts
a series of git commands to make use of git a little bit easier

commands:
* gb <branch_name>
  * creates a both local and remote branch
* gc "message"
  * git add all & commit
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
* gt <old_tag> <new_tag> 
  * renames a tag and pushes to remote

install
1. clone into the desired folder (suggestion $HOME/bin/git-shortcuts)

```git clone https://github.com/leandrorojas/git-shortcuts.git $HOME/bin/git-shortcuts```

2. edit your default shell profile and add the following at the end:

```export PATH="$HOME/bin/git-shortcuts/src:$PATH"```

3. verify that you are not using any aliases in your default shell profile that will conflict with the commands