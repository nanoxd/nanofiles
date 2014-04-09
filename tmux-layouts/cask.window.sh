window_root "~/Developer/Projects/Caskroom"

new_window "Caskroom"

# Split window into panes.
split_h 50
run_cmd "cd homebrew-cask" 1

# Set active pane.
select_pane 0
