#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/lists"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header 'Authorization: Token token="BAhJIiVmMWQzYmQ5OTJlMjZlODJhNWRiODcyYTkxNjQ5NDkxNQY6BkVG--7086516612b6d7c83402fbfe7b8399b1ca0d4f37"' \
