class ExperiencesController < ApplicationController
  before_action :set_faculty, only: [:create, :destroy]

  def create
    @experience = @faculty.experiences.new(experience_params)
    if @experience.save
      redirect_to @faculty, notice: "Experience successfully added!"
    else
      redirect to @faculty, alert: "Unable to add experience!"
    end
  end

  def destroy
    @experience = @faculty.experiences.find(params[:id])
    @experience.destroy
    redirect_to @faculty, notice: "Experience deleted!"
  end

  private
  def set_faculty
    @faculty = Faculty.find(params[:faculty_id])
  end

  def experience_params
    params.require(:experience).permit(:description, :institute, :duration)
  end
end
