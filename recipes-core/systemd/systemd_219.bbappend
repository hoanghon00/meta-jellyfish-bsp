FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_remove = "file://udev-re-enable-mount-propagation-for-udevd.patch"

SRC_URI += "\
	file://0001-udev-re-enable-mount-propagation-for-udevd.patch \
"
