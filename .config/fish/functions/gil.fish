function gil
  git log --pretty=format: '%h %ad | %s%d [%an]' --graph --date=short $argv
end
