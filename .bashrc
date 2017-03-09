# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

## Load other shell dotfiles first
# git-prompt.sh seems to be not necessary(?)
# for file in ~/.{bash_exports,bash_aliases,git-prompt.sh};
for file in ~/.{bash_exports,bash_aliases};
do
	[ -r "$file" ] && source "$file";
done;
unset file;

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

