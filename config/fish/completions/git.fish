test -f /usr/local/share/fish/completions/git.fish; and source /usr/local/share/fish/completions/git.fish

# hub create
complete -f -c git -n '__fish_git_needs_command' -a create -d 'Create this repository on GitHub and add GitHub as origin'
complete -f -c git -n '__fish_git_using_command create' -s p -d 'Create this repository as private'
complete -f -c git -n '__fish_git_using_command create' -s d -d "Set this repository's description"
complete -f -c git -n '__fish_git_using_command create' -s h -d "Set this repository's homepage"

# hub pull-request
complete -f -c git -n '__fish_git_needs_command' -a pull-request -d 'Open a pull request on GitHub'
complete -f -c git -n '__fish_git_using_command pull-request' -s f -d "Don't check for outgoing changes"
complete -f -c git -n '__fish_git_using_command pull-request' -s o -l browse -d 'Open the pull request in a web browser'
complete -f -c git -n '__fish_git_using_command pull-request' -s i -r -d 'The issue (ID or URL) to convert to a pull request'
complete -f -c git -n '__fish_git_using_command pull-request' -s b -r -d 'The base repository to use in the pull request'
complete -f -c git -n '__fish_git_using_command pull-request' -s h -r -d 'The head to use in the pull request'

# hub fork
complete -f -c git -n '__fish_git_needs_command' -a fork -d 'Make a fork of a remote repository on GitHub and add as remote'
complete -f -A -c git -n '__fish_git_using_command fork' -l no-remote -d 'Skips creation of the new remote'

# hub browse
complete -f -c git -n '__fish_git_needs_command' -a browse -d 'Open a GitHub page in the default browser'
complete -f -c git -n '__fish_git_using_command browse' -s u -d 'The user that owns the repository to browse'

# hub compare
complete -f -c git -n '__fish_git_needs_command' -a compare -d 'Open a compare page on GitHub'
complete -f -c git -n '__fish_git_using_command compare' -s u -d 'The user that owns the repository to compare'

# hub ci-status
complete -f -c git -n '__fish_git_needs_command' -a ci-status -d 'Display latest status of CI'
complete -f -c git -n '__fish_git_using_command ci-status' -s v -d 'Print the URL to CI build results'
