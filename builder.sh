#!/bin/bash
set -e
SRC_DIR="./src"
RESOURCES_DIR="./resources"
OUTPUT_DIR="./build_manual"
JAR_NAME="Ambience-mod.jar"
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR/classes"
find "$SRC_DIR" -name "*.java" > sources.txt
javac -source 1.8 -target 1.8 -d "$OUTPUT_DIR/classes" @sources.txt
rm sources.txt
if [ -d "$RESOURCES_DIR" ]; then
    cp -r "$RESOURCES_DIR"/* "$OUTPUT_DIR/classes/"
fi
cd "$OUTPUT_DIR/classes"
jar cf "../../$JAR_NAME" .
cd ../../
