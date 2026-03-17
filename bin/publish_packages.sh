#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

PACKAGES=(
  "packages/reactive_ble_platform_interface"
  "packages/reactive_ble_mobile"
  "packages/flutter_reactive_ble"
)

MODE="dry-run"
EXTRA_ARGS=()

usage() {
  cat <<'EOF'
Usage: bin/publish_packages.sh [--dry-run] [--publish] [--skip-validation]

Publishes repo packages in dependency order:
  1. scallop_reactive_ble_platform_interface
  2. scallop_reactive_ble_mobile
  3. scallop_flutter_reactive_ble

Default mode: --dry-run
Use --publish for live publish.
Pass --skip-validation to forward to `dart pub publish`.
EOF
}

for arg in "$@"; do
  case "$arg" in
    --dry-run)
      MODE="dry-run"
      ;;
    --publish)
      MODE="publish"
      ;;
    --skip-validation)
      EXTRA_ARGS+=("--skip-validation")
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown arg: $arg" >&2
      usage >&2
      exit 1
      ;;
  esac
done

publish_one() {
  local package_dir="$1"

  echo
  echo "==> $package_dir"

  (
    cd "$ROOT_DIR/$package_dir"

    if [[ "$MODE" == "dry-run" ]]; then
      dart pub publish --dry-run ${EXTRA_ARGS[@]+"${EXTRA_ARGS[@]}"}
    else
      dart pub publish ${EXTRA_ARGS[@]+"${EXTRA_ARGS[@]}"}
    fi
  )
}

echo "Mode: $MODE"
if [[ "$MODE" == "publish" ]]; then
  echo "Note: publish in dependency order; wait for pub.dev indexing between packages if needed."
fi

for package_dir in "${PACKAGES[@]}"; do
  publish_one "$package_dir"
done

echo
echo "Done."
