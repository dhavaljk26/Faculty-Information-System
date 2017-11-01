class CoursePreRequisitesController < ApplicationController
  before_action :set_course, only: [:create, :destroy]

  def create

    new_id = Integer(params[:course_pre_requisite][:course_pre_requisite_id])
    pre_arr = @course.course_pre_requisites.pluck(:course_pre_requisite_id)
    @course_pre_requisite = @course.course_pre_requisites.new(course_pre_requisite_params)

    if pre_arr.include?(new_id) or new_id == @course.id
      redirect_to @course, notice: "Invalid choice(Course already there or you have selected this course itself)!"
    elsif @course_pre_requisite.save
      redirect_to @course, notice: "Course Prerequisite successfully added!"
    else
      redirect_to @course, notice: "Unable to add Course Prerequisite!"
    end
  end

  def destroy
    @course_pre_requisite = @course.course_pre_requisites.find(params[:id])
    @course_pre_requisite.destroy
    redirect_to @course, notice: "Course prerequisite deleted!"
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def course_pre_requisite_params
    params.require(:course_pre_requisite).permit(:course_pre_requisite_id)
  end
end
