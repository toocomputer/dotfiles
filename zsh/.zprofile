arch=$(uname -m)
if [[ -f ~/.zprofile_$arch ]]; then
  source ~/.zprofile_$arch
fi
