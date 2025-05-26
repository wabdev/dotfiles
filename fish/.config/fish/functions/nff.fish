function nff
  fd --type f --strip-cwd-prefix | fzf --preview 'bat -n --color=always {}' --preview-window '~3' --bind 'enter:become(nvim {})'
end
