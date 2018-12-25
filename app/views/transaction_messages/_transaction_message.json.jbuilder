json.extract! transaction_message, :id, :created_at, :updated_at
json.url transaction_message_url(transaction_message, format: :json)
