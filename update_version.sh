#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="/Users/lvshitou/Projects/fd2re"

cp "${SRC_DIR}/更新日志（建议阅读）.md" "${SCRIPT_DIR}/content/changelog.md"
cp "${SRC_DIR}/简易攻略（玩前必读）.md" "${SCRIPT_DIR}/content/guide.md"

cd "${SCRIPT_DIR}"

git add "content/changelog.md" "content/guide.md"

if git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

git commit -m "Update 更新日志 and 攻略"
git push
