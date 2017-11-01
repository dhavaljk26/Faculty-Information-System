class QualificationsController < ApplicationController
  before_action :set_faculty, only: [:create, :destroy]

  def create
    @qualification = @faculty.qualifications.new(qualification_params)
    if @qualification.save
      redirect_to @faculty, notice: "Qualification successfully added!"
    else
      redirect to @faculty, alert: "Unable to add qualification!"
    end
  end

  def destroy
    @qualification = @faculty.qualifications.find(params[:id])
    @qualification.destroy
    redirect_to @faculty, notice: "Qualification deleted!"
  end

  private
  def set_faculty
    @faculty = Faculty.find(params[:faculty_id])
  end

  def qualification_params
    params.require(:qualification).permit(:degree_name, :degree_major, :institution, :year)
  end
end
