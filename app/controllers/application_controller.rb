class ApplicationController < ActionController::Base
	layout :layout_method
	
	private

	def layout_method
		if login_user_signed_in?
			"layout1"
		else
			"layout2"
		end
	end
end