# Desafio programação - para vaga Back-end

## Ruby version
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux]

## Dependencies
Rails 6.1.0
mysql2 0.5.3

## Configuration

### MYSQL
Config your mysql user and password and add in your environment this variables.
Ex.: export MYSQL_USERNAME="username"
You can save them in .bash_profile file.

## Database creation
```
bin/rails db:create
```
## Database initialization
```
bin/rails db:migrate
bin/rails db:seed
```
## How to run
```
bin/rails s
```
First go to 'Transactions / Upload' and upload your CNAB file.
Then go to 'List and Balance of Stores' and see a list of stores and your respective balances.

# Documentation of CNAB

| Descrição do campo  | Inicio | Fim | Tamanho | Comentário
| ------------- | ------------- | -----| ---- | ------
| Tipo  | 1  | 1 | 1 | Tipo da transação
| Data  | 2  | 9 | 8 | Data da ocorrência
| Valor | 10 | 19 | 10 | Valor da movimentação. *Obs.* O valor encontrado no arquivo precisa ser divido por cem(valor / 100.00) para normalizá-lo.
| CPF | 20 | 30 | 11 | CPF do beneficiário
| Cartão | 31 | 42 | 12 | Cartão utilizado na transação 
| Hora  | 43 | 48 | 6 | Hora da ocorrência atendendo ao fuso de UTC-3
| Dono da loja | 49 | 62 | 14 | Nome do representante da loja
| Nome loja | 63 | 81 | 19 | Nome da loja

# Documentation of transactions types

| Tipo | Descrição | Natureza | Sinal |
| ---- | -------- | --------- | ----- |
| 1 | Débito | Entrada | + |
| 2 | Boleto | Saída | - |
| 3 | Financiamento | Saída | - |
| 4 | Crédito | Entrada | + |
| 5 | Recebimento Empréstimo | Entrada | + |
| 6 | Vendas | Entrada | + |
| 7 | Recebimento TED | Entrada | + |
| 8 | Recebimento DOC | Entrada | + |
| 9 | Aluguel | Saída | - |
