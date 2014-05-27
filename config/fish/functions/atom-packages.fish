function atom-packages -d "List atom packages for easy export. Requires argument"
  apm list | cut -d '@' -f 1 | cut -d ' ' -f 2 | tail -n $argv
end
