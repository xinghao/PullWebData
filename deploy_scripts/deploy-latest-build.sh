#!/bin/sh
#
# deploy-latest-build.sh
#
# Author: Michael Chan <michael@kazaa.com>
#

APP_DIR=/SOLR/SolrServer
CURRENT=$APP_DIR/current
LATEST=$APP_DIR/latest

LATESTDIR=`cat $LATEST`

if [ -e $LATEST ]; then
  
  echo "Deploying latest build "$LATESTDIR" as current working build..."
  
  # change working dir to app dir
  cd $APP_DIR

  # shutdown service
  /etc/init.d/solr stop

  # remove current rel link
  rm -f $CURRENT

  # create new current rel link
  ln -s $APP_DIR/$LATESTDIR $CURRENT

  # startup service
  /etc/init.d/solr start
  
  echo "Deploy done."
  echo "Latest Build Now Running."
  
else
  
  echo "ERROR: Deploy failed!"
  echo "Latest Build file doesn't exist!"
  echo "Build file : "$LATEST

fi
