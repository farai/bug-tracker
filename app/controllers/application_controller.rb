class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout "main"
  
  before_filter :authenticate_user!
  
  def after_sign_in_path_for(user)
    stored_location_for(user) || home_index_path
  end
    
end
