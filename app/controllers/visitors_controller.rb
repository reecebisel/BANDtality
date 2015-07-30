class VisitorsController < ApplicationController
	layout 'visitor'
  def index
  	if user_signed_in? 
  		redirect_to profile_path(current_user.profile.id)
  	end
  end
end
