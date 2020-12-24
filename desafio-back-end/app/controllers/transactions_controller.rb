class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /transactions/upload
  def upload
    file = params[:file]

    handle_upload(file)

    redirect_to transactions_url, notice: "CNAB was successfully uploaded."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:transaction_type_id, :transaction_datetime, :value, :cpf, :card_number, :store_owner, :store_name)
  end

  def handle_upload(file)
    raise "Select a txt file to upload" if file == nil
    raise "File is not a TXT" if File.extname(file) != ".txt"

    file_data = File.read(file).split("\n")

    file_data.each { |line|
      raise "Non-standard line [" + line + "]" if line.length != 80

      type = line[0, 1]
      date = line[1, 8]
      value = line[9, 10]
      cpf = line[19, 11]
      card_number = line[30, 12]
      time = format("%02d:%02d:%02d", line[42, 2].to_i, line[44, 2].to_i, line[46, 2].to_i)
      date_time = date + " " + time + " -03"
      date_time = Time.parse(date_time)
      store_owner = line[48, 14].strip
      store_name = line[62, 19].strip

      @transaction = Transaction.new(transaction_type_id: type, transaction_datetime: date_time, value: value, cpf: cpf, card_number: card_number, store_owner: store_owner, store_name: store_name)
      @transaction.save
    }
  end
end
