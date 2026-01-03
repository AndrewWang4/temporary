#!/bin/bash
# Fully automated build script for Ambience mod (Minecraft 1.7.10)
# Downloads Forge, compiles Java, copies resources, and packages jar

set -e

# Paths
SRC_DIR="./src/main/java"
RESOURCES_DIR="./src/main/resources"
LIBS_DIR="./libs/forge"
FORGE_VERSION="1.7.10-10.13.4.1614-1.7.10"
FORGE_JAR="$LIBS_DIR/forge-$FORGE_VERSION-universal.jar"
OUTPUT_DIR="./build_manual"
JAR_NAME="Ambience-mod.jar"

# Create necessary folders
mkdir -p "$LIBS_DIR"
mkdir -p "$OUTPUT_DIR/classes"

# Download Forge jar if missing
if [ ! -f "$FORGE_JAR" ]; then
    echo "Downloading Forge $FORGE_VERSION..."
    wget -O "$FORGE_JAR" "https://files.minecraftforge.net/maven/net/minecraftforge/forge/$FORGE_VERSION/forge-$FORGE_VERSION-universal.jar"
fi

# Clean previous build
rm -rf "$OUTPUT_DIR/classes/*"

echo "Compiling Java source..."
SOURCES=$(find "$SRC_DIR" -type f -name "*.java")
javac -source 1.8 -target 1.8 -cp "$FORGE_JAR" -d "$OUTPUT_DIR/classes" $SOURCES

echo "Copying resources..."
if [ -d "$RESOURCES_DIR" ]; then
    cp -r "$RESOURCES_DIR"/* "$OUTPUT_DIR/classes/"
fi

echo "Packaging jar..."
cd "$OUTPUT_DIR/classes"
jar cf "../../$JAR_NAME" .
cd ../../

echo "Build complete! Output jar: $JAR_NAME"
