#!/bin/bash

set -ex

INSTALL_FOLDER=/tmp/nwrfcsdk/
mkdir -p $INSTALL_FOLDER
cp nwrfcsdk/13-20004565.SAR $INSTALL_FOLDER
cp nwrfcsdk/SAPCAR $INSTALL_FOLDER
cd $INSTALL_FOLDER
chmod +x SAPCAR
./SAPCAR -xvf 13-20004565.SAR
mkdir -p /usr/sap && mkdir -p /usr/lib64
mv nwrfcsdk /usr/sap/13-20004565
ln -s /usr/sap/13-20004565 /usr/sap/nwrfcsdk
export LD_LIBRARY_PATH=/usr/sap/nwrfcsdk/lib/

ln -s /usr/sap/nwrfcsdk/lib/libicudata.so.34  /usr/lib/libicudata.so.34
ln -s /usr/sap/nwrfcsdk/lib/libicudata.so.34  /usr/lib64/libicudata.so.34

ln -s /usr/sap/nwrfcsdk/lib/libicudecnumber.so  /usr/lib/libicudecnumber.so
ln -s /usr/sap/nwrfcsdk/lib/libicudecnumber.so  /usr/lib64/libicudecnumber.so

ln -s /usr/sap/nwrfcsdk/lib/libicui18n.so.34  /usr/lib/libicui18n.so.34
ln -s /usr/sap/nwrfcsdk/lib/libicui18n.so.34  /usr/lib64/libicui18n.so.34

ln -s /usr/sap/nwrfcsdk/lib/libicuuc.so.34  /usr/lib/libicuuc.so.34
ln -s /usr/sap/nwrfcsdk/lib/libicuuc.so.34  /usr/lib64/libicuuc.so.34

ln -s /usr/sap/nwrfcsdk/lib/libsapnwrfc.so  /usr/lib/libsapnwrfc.so
ln -s /usr/sap/nwrfcsdk/lib/libsapnwrfc.so  /usr/lib64/libsapnwrfc.so

ln -s /usr/sap/nwrfcsdk/lib/libsapucum.so  /usr/lib/libsapucum.so
ln -s /usr/sap/nwrfcsdk/lib/libsapucum.so  /usr/lib64/libsapucum.so


cd -
ruby setup.rb config --with-nwrfcsdk-dir=/usr/sap/nwrfcsdk
ruby setup.rb setup
ruby setup.rb install
