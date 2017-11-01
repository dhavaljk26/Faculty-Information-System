class AchievementsController < ApplicationController
  before_action :set_faculty, only: [:create, :destroy]

  def create
    @achievement = @faculty.achievements.new(achievement_params)
    if @achievement.save
      redirect_to @faculty, notice: "Achievement successfully added!"
    else
      redirect to @faculty, alert: "Unable to add achievement!"
    end
  end

  def destroy
    @achievement = @faculty.achievements.find(params[:id])
    @achievement.destroy
    redirect_to @faculty, notice: "Achievement deleted!"
  end

  private
  def set_faculty
    @faculty = Faculty.find(params[:faculty_id])
  end

  def achievement_params
    params.require(:achievement).permit(:description)
  end
end
