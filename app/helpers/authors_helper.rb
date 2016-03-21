module AuthorsHelper

	def is_admin?
    	current_user.to_s == "admin"
  	end

end
