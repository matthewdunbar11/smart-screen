class ApplicationController < ActionController::Base
  check_authorization unless: :devise_controller?

  breadcrumb 'Home', :root_path
end
