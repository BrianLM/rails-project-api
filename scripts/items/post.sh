curl --include --request POST "http://localhost:4741/items" \
  --header "Content-Type: application/json" \
  --header 'Authorization: Token token="BAhJIiUzZTQ2N2RkNDUyNjIxMzdkNjA2NzE0OWE2NjVhZDMxZAY6BkVG--149ac534efd67334986c5f8b0f86ed020ba8e896"' \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "unit": "'"${UNIT}"'",
      "unit_quantity": "'"${QTY}"'"
    }
  }'

echo
# :name, :unit, :unit_quantity
