curl --include --request POST "http://localhost:4741/new_list" \
  --header "Content-Type: application/json" \
  --header 'Authorization: Token token="BAhJIiUzZTQ2N2RkNDUyNjIxMzdkNjA2NzE0OWE2NjVhZDMxZAY6BkVG--149ac534efd67334986c5f8b0f86ed020ba8e896"' \
  --data '{
    "list": {
      "active": true,
      "list_items": {
        "1": {
          "item_id": 1,
          "quantity": "12"
        },
        "2": {
          "item_id": 2,
          "quantity": "1"
        },
        "3": {
          "item_id": 3,
          "quantity": "1"
        }
      }
    }
  }'
