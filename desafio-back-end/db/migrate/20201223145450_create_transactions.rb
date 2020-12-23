class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :transaction_type, null: false, foreign_key: true
      t.datetime :transaction_datetime
      t.decimal :value
      t.string :cpf
      t.string :card_number
      t.string :store_owner
      t.string :store_name

      t.timestamps
    end
  end
end
