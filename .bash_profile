# Add '~/bin' to the '$PATH'
export PATH="$HOME/bin:$PATH";

# Load other shell dotfiles
for file in ~/.{aliases,exports};
do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

