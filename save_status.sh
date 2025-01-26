#!/bin/bash

SUCCESS="✅"
FAIL="❌"
STATUS=""

if [ "$CI_JOB_STATUS" == "success" ]; then
  STATUS="success $SUCCESS"
else
  STATUS="fail $FAIL"
fi

echo "🚀 $CI_JOB_NAME: $STATUS" >> pipelines.sh