#!/bin/sh
#
# get-latest-build.sh
#
# Get the latest build from a git repo.
#
# Author: Michael Chan <michael@kazaa.com>
#

APP_DIR=/SOLR/SolrServer
DATE=`date +%Y%m%d%H%M`
GITREPO="git@github.com:Creagency/altnet-solr-master.git"


# change working dir to solr dir
cd $APP_DIR

# git clone latest build
/usr/local/bin/git clone $GITREPO $APP_DIR/$DATE

# update/create release date in latest file
echo $DATE  > $APP_DIR/latest
