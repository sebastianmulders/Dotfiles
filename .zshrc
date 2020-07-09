# Source files in ~/.shell
for file in $HOME/.shell/*; do
  source $file;
done

# Added by Krypton
export GPG_TTY=$(tty)
