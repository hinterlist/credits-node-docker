#!/bin/bash
#
# Fetch credits node version 4.1 and extract files to /opt/node

echo "Downloading credits node"
curl https://credits.com/Content/file_users/Credits_Node_linux_x64_ver_4.1.tar.gz \
    --output /tmp/credits.tgz \
    --progress-bar
tar zxf /tmp/credits.tgz --directory /tmp --verbose
mv /tmp/credits /opt/node
rm -rf /tmp/credits.tgz