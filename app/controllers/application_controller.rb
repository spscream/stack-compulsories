require "application_responder"

class ApplicationController < ActionController::Base
    include Pundit
    self.responder = ApplicationResponder
    respond_to :html

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    rescue_from 'Pundit::NotAuthorizedError' do |e|
        user_not_authorized
    end

    private

    def user_not_authorized
        flash[:alert] = 'You are not authorized to perform this action.'
        redirect_to(request.referrer || root_path)
    end
end
