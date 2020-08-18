class ApplicationController < ActionController::Base

private 
def current_user 
current_user = Company.find_by(id:session[:company_id])
end 

end
