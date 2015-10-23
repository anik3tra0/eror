class ContactsController < ApplicationController

	def new
		@contact = Contact.new

	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash.now[:error] = nil
		else
			flash.now[:error] = 'Houston! We have a problem! Message not sent! If this is a multiple occurance, kindly report on the application page on github.'
			render :new
		end
	end
end
