class AuthController < ApplicationController
  def google_oauth2
      email = request.env["omniauth.auth"][:info][:email]
      session[:user] = email
      if ADMINS.include? email
        session[:admin] = true
      end
      redirect_to students_url
  end

  def logout
    session[:admin] = false
    redirect_to root_path
  end
end
