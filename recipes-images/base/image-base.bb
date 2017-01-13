require recipes-core/images/core-image-minimal.bb

IMAGE_FEATURES += " \
	ssh-server-openssh \
	package-management \
"

# NetworkManager and relate packages
IMAGE_INSTALL_append = " networkmanager net-tools"

IMAGE_INSTALL_append = " util-linux"

# Utilities
IMAGE_INSTALL_append = " sysbench vim"
