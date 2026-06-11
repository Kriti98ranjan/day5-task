
TIMESTAMP=$(date "+%Y%m%d-%H%M%S")
BUILD_NAME="build-${TIMESTAMP}"
OUTPUT="artifacts/${BUILD_NAME}.tgz"

mkdir -p artifacts

echo "==============================="
echo "Building: $BUILD_NAME"
echo "==============================="

bash validate.sh
if [ $? -ne 0 ]; then
  echo "BUILD FAILED: Validation errors!"
  exit 1
fi

tar -czf "$OUTPUT" src/ logs/ config.json package.json

if [ -f "$OUTPUT" ]; then
  echo "Artifact created: $OUTPUT"
else
  echo "ERROR: Artifact not created!"
  exit 1
fi

sha256sum "$OUTPUT" > "${OUTPUT}.sha256"

echo "==============================="
echo "Artifact : $OUTPUT"
echo "Checksum : ${OUTPUT}.sha256"
echo "SHA256   : $(cat ${OUTPUT}.sha256 | cut -d' ' -f1)"
echo "==============================="
