
function error {
	echo $*
	exit 2
}

PROFILE=~/.bash_profile
if [ -f ~/.profile ]
then
    PROFILE=~/.profile
fi
DENV=$(dirname $(dirname $0))/etc/dare-aws-cli.rc

if ! grep $DENV $PROFILE >/dev/null 2>&1
then
    echo "" >> $PROFILE
    echo "# ADDED by ${USER} on $(date)" >> $PROFILE
    echo "# BY running $0" >> $PROFILE
    echo ". $DENV" >> $PROFILE

    echo "Added $DENV to your $PROFILE"
    echo "Restart your login sesison and your are all set."
else
    echo "Your environment is already setup, you're all set."
fi