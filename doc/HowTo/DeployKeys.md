# Deploy Keys

Set up the .ssh/config as per the snippet example in this directory.

Ensure that the private deploy key is available in the listed location.  In docker this can be transiently bind mounted via 
the -v local_dir:container_dir directive.

For docker, note the need to have set the git user.name and user.email so that commit strings are appropriately formatted.
Host github.com-sigtools
	Hostname github.com
	IdentityFile=/keys/id_ecsda-gh-MARTe2-sigtools
