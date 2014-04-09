window_root "~/Developer/Projects/byo-lisp"

new_window "BYOLisp"

# Split window into panes.
split_v 20
run_cmd "vagrant up"

# Set active pane.
select_pane 0
