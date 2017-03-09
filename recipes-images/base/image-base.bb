require recipes-core/images/core-image-minimal.bb

IMAGE_FEATURES += " \
	ssh-server-openssh \
	package-management \
"

# Add kernel modules
IMAGE_INSTALL_append = " \
	kernel-modules \
"

# connman
IMAGE_INSTALL_append = " connman connman-client net-tools"

IMAGE_INSTALL_append = " util-linux"

# OpenCV packages
IMAGE_INSTALL_append = " opencv opencv-dev opencv-samples cmake"

# Utilities
IMAGE_INSTALL_append = " sysbench vim"
