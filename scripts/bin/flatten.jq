reduce ( tostream | select(length == 2) ) as $item ({}; .[ $item[0] |
  map(tostring) |
  join(".") ] = $item[1])
