curl --include --request POST "http://localhost:4741/new_list" \
  --header "Content-Type: application/json" \
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
