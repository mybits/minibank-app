class SessionsController < ApplicationController

	skip_before_filter :auth!, only: [:new, :create]

	def new
	end

	def create
		client = Client.find_by_email(params[:email])
		if client && client.authenticate(params[:password])
			session[:client_id] = client.id
			redirect_to client_accounts_path(client), notice: 'Welcome :)'
		else
			flash.now.alert = 'Wrong e-mail or password.'
			render action: 'new'
		end
	end

	def destroy
		session[:client_id] = nil
		redirect_to root_path, notice: 'See you soon...'
	end
end
