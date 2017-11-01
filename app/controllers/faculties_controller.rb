class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy, :see_projects, :add_project, :del_project, :see_courses, :add_course, :del_course, :see_publications, :add_publication, :del_publication, :see_leave_applications]

  def department_wise
    if request.post?
      @dept_id = params[:faculty][:department_id]
    end
  end

  def see_leave_applications
  end

  def see_projects
  end

  def add_project

    if@faculty.projects.pluck(:id).include?(Integer(params[:add][:add_project_id]))
      redirect_to "/faculties/#{@faculty.id}/see_projects", notice: "Project is already added!"
    else
      @faculty.projects << Project.find(Integer(params[:add][:add_project_id]))
      redirect_to "/faculties/#{@faculty.id}/see_projects", notice: "Project added successfully!"
    end
  end

  def del_project
    @faculty.projects.destroy(Project.find(Integer(params[:del][:del_project_id])))
    redirect_to "/faculties/#{@faculty.id}/see_projects", notice: "Project removed successfully!"
  end

  def see_publications
  end

  def add_publication

    if@faculty.publications.pluck(:id).include?(Integer(params[:add][:add_publication_id]))
      redirect_to "/faculties/#{@faculty.id}/see_publications", notice: "Publication is already added!"
    else
      @faculty.publications << Publication.find(Integer(params[:add][:add_publication_id]))
      redirect_to "/faculties/#{@faculty.id}/see_publications", notice: "Publication added successfully!"
    end
  end

  def del_publication
    @faculty.publications.destroy(Publication.find(Integer(params[:del][:del_publication_id])))
    redirect_to "/faculties/#{@faculty.id}/see_publications", notice: "Publication removed successfully!"
  end

  def see_courses
  end

  def add_course

    if@faculty.courses.pluck(:id).include?(Integer(params[:add][:add_course_id]))
      redirect_to "/faculties/#{@faculty.id}/see_courses", notice: "Course is already added!"
    else
      @faculty.courses << Course.find(Integer(params[:add][:add_course_id]))
      redirect_to "/faculties/#{@faculty.id}/see_courses", notice: "Course added successfully!"
    end
  end

  def del_course
    @faculty.courses.destroy(Course.find(Integer(params[:del][:del_course_id])))
    redirect_to "/faculties/#{@faculty.id}/see_courses", notice: "Course removed successfully!"
  end
  # GET /faculties
  # GET /faculties.json
  def index
    @faculties = Faculty.all
  end

  # GET /faculties/1
  # GET /faculties/1.json
  def show
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
  end

  # GET /faculties/1/edit
  def edit
  end

  # POST /faculties
  # POST /faculties.json
  def create
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty, notice: 'Faculty was successfully created.' }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to @faculty, notice: 'Faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_url, notice: 'Faculty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_params
      params.require(:faculty).permit(:first_name, :middle_name, :last_name, :designation, :joining_date, :office_phone_no, :mobile_no, :birth_date, :gender, :office_address_locality, :office_address_city, :office_address_state, :office_address_country, :office_address_pin_code, :home_address_locality, :home_address_city, :home_address_state, :home_address_country, :home_address_pin_code, :email, :password, :password_confirmation, :department_id, :admin)
    end
end
