# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Developer/Projects/byo-lisp"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "BYOLisp"

# Split window into panes.
split_v 20
run_cmd "vagrant up"
# split_h 60

# Set active pane.
select_pane 0
