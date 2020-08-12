class ApplicationController < ActionController::Base

def current_user 
return unless session[:id] 
@c ||= Company.find(session[:id])
end

def logged_in
!!current_user
end

def allowed

end

end
