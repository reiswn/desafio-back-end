json.extract! transaction_type, :id, :description, :kind, :sign, :created_at, :updated_at
json.url transaction_type_url(transaction_type, format: :json)
