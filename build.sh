pushd curl
echo "About to build libCurl"
pwd
export MACOSX_DEPLOYMENT_TARGET="10.10"
./configure --disable-ldap --without-ssl --without-libidn  --without-libssh2
make -j8
popd
