################################################################################
#
# LTE_CELL_SCANNER
#
################################################################################

LTE_CELL_SCANNER_VERSION = ef1ad25626dcf313209f07b7bebd54e1b8523cea
LTE_CELL_SCANNER_SITE = git://github.com/JiaoXianjun/LTE-Cell-Scanner.git
LTE_CELL_SCANNER_DEPENDENCIES =  librtlsdr boost

$(eval $(cmake-package))

