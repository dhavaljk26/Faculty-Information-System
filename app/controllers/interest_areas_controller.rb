class InterestAreasController < ApplicationController
  before_action :set_faculty, only: [:create, :destroy]

  def create
    @interest_area = @faculty.interest_areas.new(interest_area_params)
    if @interest_area.save
      redirect_to @faculty, notice: "Interest Area successfully added!"
    else
      redirect to @faculty, alert: "Unable to add Interest area!"
    end
  end

  def destroy
    @interest_area = @faculty.interest_areas.find(params[:id])
    @interest_area.destroy
    redirect_to @faculty, notice: "Interest area deleted!"
  end

  private
  def set_faculty
    @faculty = Faculty.find(params[:faculty_id])
  end

  def interest_area_params
    params.require(:interest_area).permit(:name)
  end
end
