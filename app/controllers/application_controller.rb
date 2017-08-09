class ApplicationController < ActionController::API
  include ExceptionHandler
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :null_session
end
