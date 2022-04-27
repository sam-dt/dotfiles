function go
  set --local branch (git branch |rg $argv -S |tr -d ' ')
  set --local branchCount (echo $branch |tr ' ' '\n' |wc -l |tr -d ' ')

  if test $branchCount -gt 1
    echo 'Multiple matches found: '
    echo $branch |tr ' ' '\n'
    return 0
  end

  if test -z $branch
    echo 'No matches found. Go fish!'
    return 0
  end

  git checkout $branch
end
