./gradlew clean
rm -rf .gradle
rm -rf .minecraft
rm -rf build
./gradlew setupDecompWorkspace --refresh-dependencies --stacktrace -Dhttps.protocols=TLSv1.2
