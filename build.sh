pushd "$(dirname "$0")"/curl

echo "About to build libCurl"
pwd
export MACOSX_DEPLOYMENT_TARGET="10.10"
./configure --disable-ldap --without-ssl --without-libidn  --without-libssh2
make -j8
# FIX for Curl on Mac - we want to ignore changes to the tracked files below
git update-index --skip-worktree -- Makefile include/curl/curlbuild.h

popd
