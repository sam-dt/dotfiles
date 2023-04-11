function to
  set dir (find ~/codifly ~ -mindepth 1 -maxdepth 1 -type d | fzf)

  if set -q dir
    tmux new-session -A -s (basename "$dir") -c "$dir" nvim -c 'Telescope find_files'
  end
end
