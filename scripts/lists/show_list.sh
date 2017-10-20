#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/lists/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header 'Authorization: Token token="BAhJIiUzZTQ2N2RkNDUyNjIxMzdkNjA2NzE0OWE2NjVhZDMxZAY6BkVG--149ac534efd67334986c5f8b0f86ed020ba8e896"'
