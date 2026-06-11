
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_FILE="logs/validate.log"
EXIT_CODE=0

mkdir -p logs

log() {
  echo "[$TIMESTAMP] [$1] $2"
  echo "[$TIMESTAMP] [$1] $2" >> "$LOG_FILE"
}

if [ -d "src" ]; then
  log "PASS" "src/ directory exists"
else
  log "FAIL" "src/ directory MISSING"
  EXIT_CODE=1
fi


if [ -f "config.json" ]; then
  if node -e "JSON.parse(require('fs').readFileSync('config.json','utf8'))" > /dev/null 2>&1; then
    log "PASS" "config.json is valid JSON"
  else
    log "FAIL" "config.json is INVALID JSON"
    EXIT_CODE=1
  fi
else
  log "FAIL" "config.json MISSING"
  EXIT_CODE=1
fi

if [ $EXIT_CODE -eq 0 ]; then
  log "INFO" "ALL CHECKS PASSED"
else
  log "INFO" "VALIDATION FAILED"
fi

exit $EXIT_CODE
