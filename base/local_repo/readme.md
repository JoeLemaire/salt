# local_repo

# This is for configuring a CentOS server with the local repo, and renaming the other repos out of the way so they are not used.

# This state:
# - copys the vtviplocalrepo.repo file to the server
# - renames the existing .repo files to .old
# - runs yum clean all so the server uses the new repo