################################################################################
#
# Multimon-ng
#
################################################################################

MULTIMON_NG_VERSION = 4c18b489861840cfba5a3d7466a18188e16fd971
MULTIMON_NG_SITE = git://github.com/eliasoenal/multimon-ng.git
MULTIMON_NG_DEPENDENCIES =  librtlsdr

$(eval $(cmake-package))

