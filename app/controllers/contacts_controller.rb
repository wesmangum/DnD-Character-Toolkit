class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash.notice = "Your message was delivered successfully!"
			redirect_to root_path
		else
			flash.notice = "Cannot send message."
			redirect_to contacts_path(@character)
		end
	end
end