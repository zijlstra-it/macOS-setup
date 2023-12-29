# Checkout all branches from remote as tracking branches.
# Based on
# - https://stackoverflow.com/questions/379081/track-all-remote-git-branches-as-local-branches/6300386#6300386
# - https://stackoverflow.com/questions/1914579/set-up-git-to-pull-and-push-all-branches
#

UPSTREAM=$1
MYREPO=$2

usage() {
	echo "Usage:"
	echo "$0 <upstream-remote> <target-remote>"
	echo ""
	echo "Example which ensures remote named 'myrepo' have all the same branches and tags as 'origin'"
	echo "$0 origin myrepo"
	exit 1
}

trap 'echo ; exit' INT

if [ -z "$UPSTREAM" ]; then
	echo Missing upstream remote name.
	usage
fi

if [ -z "$MYREPO" ]; then
	echo Missing target remote name.
	usage
fi

echo
echo "Configured remotes:"
echo
git remote -vv
echo

echo
read -p "1. This will setup '$MYREPO' to track all branches in '$UPSTREAM' - Are you sure ?" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
	git fetch "$UPSTREAM"
	#for brname in `git branch -r | grep "$UPSTREAM" | grep -v master | grep -v HEAD | sed -e 's/^[^\/]*\///'`; do git branch --track $brname  $UPSTREAM/$brname ; echo ; done
	for brname in $(git branch -r | grep "$UPSTREAM" | grep -v HEAD | sed -e 's/^[^\/]*\///'); do git branch --track $brname $UPSTREAM/$brname; done
fi

echo
read -p "2. This will push all local branches and tags into '$MYREPO' - Are you sure ?" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
	git pull --all
	git push --all "$MYREPO"
# git push --tags $MYREPO
fi
