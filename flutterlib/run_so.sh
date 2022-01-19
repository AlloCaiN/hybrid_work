#cd ${FLUTTER_ROOT}/bin/cache/artifacts/engine
#for arch in android-arm android-arm-profile android-arm-release; do
#  pushd $arch
#  cp flutter.jar flutter-armeabi-v7a.jar # 备份
#  unzip flutter.jar lib/armeabi-v7a/libflutter.so
#  mv lib/armeabi-v7a lib/armeabi
#  zip -d flutter.jar lib/armeabi-v7a/libflutter.so
#  zip flutter.jar lib/armeabi/libflutter.so
#  popd
#done
