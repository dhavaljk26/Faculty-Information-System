class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :add_faculty, :del_faculty]

  def add_faculty

    if @course.faculties.pluck(:id).include?(Integer(params[:add][:add_faculty_id]))
      redirect_to @course, notice: "Faculty is already added!"
    else
      @course.faculties << Faculty.find(Integer(params[:add][:add_faculty_id]))
      redirect_to @course, notice: "Faculty added successfully!"
    end
  end

  def del_faculty
    @course.faculties.destroy(Faculty.find(Integer(params[:del][:del_faculty_id])))
    redirect_to @course, notice: "Faculty removed successfully!"
  end

  def department_wise
    if request.post?
      @dept_id = params[:course][:department_id]
    end
  end

  def degree_wise
    if request.post?
      @degree_id = params[:course][:degree_id]
    end
  end
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    CoursePreRequisite.where(:course_pre_requisite_id => @course.id).delete_all
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :credits, :ltp, :course_type, :academic_degree_id, :department_id)
    end
end
