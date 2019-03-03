#!/bin/bash -e

echo Add custom settings to $DSS_DATADIR/install.ini
cat /install.ini >> $DSS_DATADIR/install.ini

CACERTS=$(readlink -f $(which java) | sed 's/bin\/java/lib\/security\/cacerts/')
echo CACERT=$CACERTS

sed -i 's/%(ENV_DIP_HOME)s/\/tmp/g' /home/dataiku/dss/install-support/supervisord.conf
sed -i 's/\/tmp\/bin/\/home\/dataiku\/dss\/bin/g' /home/dataiku/dss/install-support/supervisord.conf