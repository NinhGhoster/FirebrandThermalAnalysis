#!/usr/bin/env bash
set -euo pipefail

# Package a Linux AppImage from the PyInstaller output.
# Requires appimagetool installed on Linux.

APP_NAME="FirebrandThermalAnalysis"
DIST_DIR="dist/${APP_NAME}"
APPDIR="build/AppDir"
OUT="dist/${APP_NAME}.AppImage"

if [[ ! -d "$DIST_DIR" ]]; then
  echo "Expected ${DIST_DIR}. Run a Linux build with PyInstaller first." >&2
  exit 1
fi

rm -rf "$APPDIR"
mkdir -p "$APPDIR/usr/bin"
cp -R "$DIST_DIR" "$APPDIR/usr/bin/${APP_NAME}"

cat > "$APPDIR/AppRun" <<'EOF'
#!/usr/bin/env bash
HERE="$(dirname "$(readlink -f "$0")")"
exec "$HERE/usr/bin/FirebrandThermalAnalysis/FirebrandThermalAnalysis" "$@"
EOF
chmod +x "$APPDIR/AppRun"

cat > "$APPDIR/${APP_NAME}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=${APP_NAME}
Exec=${APP_NAME}
Terminal=false
Categories=Utility;
EOF

appimagetool "$APPDIR" "$OUT"
echo "AppImage created at: $OUT"
