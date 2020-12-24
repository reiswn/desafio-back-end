class StoresController < ApplicationController
  def index
    @stores = Transaction.select("store_name").group("store_name")
  end

  def show
    @transactions = Transaction.where(store_name: params[:store_name]).order(:transaction_datetime)
    if @transactions.size != 0
      @saldo = 0

      @transactions.each do |transaction|
        if (transaction.transaction_type.sign == "+")
          @saldo += transaction.value
        else
          @saldo -= transaction.value
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to stores_url, flash: { error: "Store " + params[:store_name] + " not found." } }
      end
    end
  end
end
