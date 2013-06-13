#!/bin/bash
#
# script to re-make init.pp to include all other pp files in this directory
#

pushd `dirname $0` > /dev/null

(
cat <<EOF
# Class: puppet-archlinux-macbookretina
#
# Manage includes of other puppet-archlinux-macbookretina classes
# top-level class for puppet-archlinux-macbookretina ecosystem
#
# WARNING - WARNING - this file is generated by makeinitpp.sh. 
#   any local changes will be overwritten.
#
# Parameters:
#
# Actions:
#   - Include other classes
#
# Requires:
#
# Sample Usage:
#
class puppet-archlinux-macbookretina {
EOF
) > init.pp

for i in `ls -1 *.pp | grep -v "init.pp" | awk -F \. '{print $1}'`
do
	summary=`awk '{if (NR==3) print $0}' $i.pp`
	echo "  $summary" >> init.pp
	echo "  include puppet-archlinux-macbookretina::$i" >> init.pp
	echo >> init.pp
done
echo "}" >> init.pp

popd > /dev/null
