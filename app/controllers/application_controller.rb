class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def headshot_custom_file_path
	file_name = "#{session[:id]}.jpg"
	File.join(Rails.root, 'public', 'headshots', file_name)
  end

end
