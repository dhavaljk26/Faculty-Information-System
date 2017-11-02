class SessionsController < ApplicationController
  def new
  end

  def create
    faculty = Faculty.find_by(email: params[:faculty][:email])
    password = params[:faculty][:password]

    if faculty && faculty.authenticate(password)
      session[:faculty_id] = faculty.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      redirect_to root_path, alert: "Invalid username/password combination"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "You have been logged out"
  end
end
