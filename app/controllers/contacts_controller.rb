class ContactsController < ApplicationController

	before_action :authenticate_user!

    def index
    end

    def create
    	@contact = Contact.new(contact_params)

    end

    private
    def contact_params
    	params.require(:contant).permit(:user_id, :title, :body)
    end
end
