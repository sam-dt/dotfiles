function go
  set --local branch (git branch |rg $argv |sed 's/ *//g')
  set --local branchCount (echo "$branch" |wc -l |sed 's/ *//g')
  switch $branchCount
    case 0
      echo "No matches found."
    case 1
      git checkout "$branch"
    case '*'
      echo "$branch"
  end
end
