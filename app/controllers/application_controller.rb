class ApplicationController < ActionController::Base
    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

    # Helper method to access on both Controller and View
    helper_method :current_user 
end
