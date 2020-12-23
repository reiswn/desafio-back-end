class CreateTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_types do |t|
      t.string :description
      t.string :kind
      t.string :sign

      t.timestamps
    end
  end
end
