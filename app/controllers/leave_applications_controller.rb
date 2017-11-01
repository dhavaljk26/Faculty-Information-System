class LeaveApplicationsController < ApplicationController
  before_action :set_faculty, only: [:create, :destroy]

  def create
    @leave_application = @faculty.leave_applications.new(leave_application_params)
    if @leave_application.save
      redirect_to "/faculties/#{@faculty.id}/see_leave_applications", notice: "Leave Application successfully submitted!"
    else
      redirect_to "/faculties/#{@faculty.id}/see_leave_applications", alert: "Unable to submit Leave Application!"
    end
  end

  def destroy
    @leave_application = @faculty.leave_applications.find(params[:id])
    @leave_application.destroy
    redirect_to "/faculties/#{@faculty.id}/see_leave_applications", notice: "Application deleted!"
  end

  private
  def set_faculty
    @faculty = Faculty.find(params[:faculty_id])
  end

  def leave_application_params
    params.require(:leave_application).permit(:leaving_date, :no_of_days, :reason, :approved)
  end
end
