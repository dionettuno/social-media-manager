#!/usr/bin/env bash
# Fallisce se nel repo compaiono chiavi, token o dati personali evidenti.
set -u
PATTERN='(sk-ant-[A-Za-z0-9_-]{10,}|sk-[A-Za-z0-9]{32,}|ghp_[A-Za-z0-9]{30,}|github_pat_[A-Za-z0-9_]{30,}|gho_[A-Za-z0-9]{30,}|AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z_-]{30,}|xox[baprs]-[A-Za-z0-9-]{10,}|-----BEGIN [A-Z ]*PRIVATE KEY-----|[A-Za-z0-9._%+-]+@(gmail|hotmail|outlook|yahoo|icloud)\.[a-z]{2,})'
hits=$(git ls-files -z | xargs -0 grep -InE "$PATTERN" -- 2>/dev/null | grep -v '^scripts/check_secrets.sh' || true)
if [ -n "$hits" ]; then
  echo "POSSIBILI DATI SENSIBILI TROVATI (valori mascherati):"
  echo "$hits" | sed -E 's/(:[0-9]+:).*/\1 [riga mascherata]/'
  exit 1
fi
old=$(grep -rIniE "market[ _-]?lens|trarketlens" output 2>/dev/null || true)
if [ -n "$old" ]; then
  echo "VECCHIO NOME (MarketLens) trovato in output/: va sostituito con TradeGPT"; echo "$old" | cut -c1-160; exit 1
fi
echo "Nessun dato sensibile evidente, nome brand ok."
