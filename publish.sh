#!/usr/bin/env bash
# Публикация портфолио на GitHub.
#   ./publish.sh git@github.com:<логин>/portfolio.git
set -euo pipefail
url="${1:?usage: ./publish.sh git@github.com:<логин>/portfolio.git}"

git init -q 2>/dev/null || true
git add -A
git -c user.name="Konstantin Masalkin" -c user.email="kemerovogo@users.noreply.github.com" \
    commit -q -m "Портфолио: четыре кейса" || echo "нечего коммитить"
git branch -M main
git remote remove origin 2>/dev/null || true
git remote add origin "$url"
git push -u origin main
echo "готово: $url"
echo "включи Pages: Settings -> Pages -> Deploy from a branch -> main / (root)"
