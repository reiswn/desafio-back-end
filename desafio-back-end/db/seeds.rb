# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TransactionType.create!(id: 1, description: "Débito", kind: "Entrada", sign: "+")
TransactionType.create!(id: 2, description: "Boleto", kind: "Saída", sign: "-")
TransactionType.create!(id: 3, description: "Financiamento", kind: "Saída", sign: "-")
TransactionType.create!(id: 4, description: "Crédito", kind: "Entrada", sign: "+")
TransactionType.create!(id: 5, description: "Recebimento Empréstimo", kind: "Entrada", sign: "+")
TransactionType.create!(id: 6, description: "Vendas", kind: "Entrada", sign: "+")
TransactionType.create!(id: 7, description: "Recebimento TED", kind: "Entrada", sign: "+")
TransactionType.create!(id: 8, description: "Recebimento DOC", kind: "Entrada", sign: "+")
TransactionType.create!(id: 9, description: "Aluguel", kind: "Saída", sign: "-")
