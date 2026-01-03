#!/bin/bash
set -e
cd "$(dirname "$0")"
rm -rf build run
chmod +x gradlew
cat > build.properties <<EOL
mod_name=Ambience
forge_version=14.21.0.2331
dir_repo=./
mc_mappings=snapshot_20161220
version=1.1
build_number=20
EOL
./gradlew setupDecompWorkspace --no-daemon -Dorg.gradle.parallel=false
./gradlew build --no-daemon -Dorg.gradle.parallel=false
