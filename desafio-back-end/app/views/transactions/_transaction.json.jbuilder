json.extract! transaction, :id, :transaction_type_id, :transaction_datetime, :value, :cpf, :card_number, :store_owner, :store_name, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
