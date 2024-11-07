APP_NAME="kusho"

if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "darwin"* ]]; then
  CONFIG_DIR="$HOME/.config/$APP_NAME"
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  CONFIG_DIR="$APPDATA/$APP_NAME"
else
  echo "Unsupported OS"
  exit 1
fi

UUID_FILE="$CONFIG_DIR/saved_uuid.txt"
mkdir -p "$CONFIG_DIR"

if [[ -f "$UUID_FILE" ]]; then
  saved_uuid=$(cat "$UUID_FILE")
  echo "Saved UUID: $saved_uuid"
else
  new_uuid=$(uuidgen)
  echo "$new_uuid" > "$UUID_FILE"
  echo "New UUID generated and saved: $new_uuid"
fi