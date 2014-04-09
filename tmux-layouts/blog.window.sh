window_root "~/Developer/Projects/blog"

new_window "Blog"

# Split window into panes.
split_v 20
run_cmd "rake preview"
run_cmd "e ." 1

# Set active pane.
select_pane 0
