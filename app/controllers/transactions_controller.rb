class TransactionsController < ApplicationController

	before_filter :find_account

	def new
		@transaction = @account.transactions.new
	end

	def create
		@transaction = @account.transactions.new(transaction_params)
		if @transaction.save
			msg = "Transakcja zapisana pomyślnie"
			redirect_to account_transaction_path(@account), notice: msg
		else
			render action: 'new'
		end
	end

	private
		def find_account
			@account = Account.find(params[:account_id])
			@client = @account.client
		end
end
