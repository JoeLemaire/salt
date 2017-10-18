#Salt-minion

# This was mainly created for deploying salt-minions after the servers were already built.  

# This state:
# - adds the salt repo
# - Installs the salt-minion package via Yum
# - sets the salt master
# - sets the proper minion ID
# - starts the salt-minion service