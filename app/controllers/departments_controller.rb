class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def add_academic_degree

    @department = Department.find(Integer(params[:id]))
    if @department.academic_degrees.pluck(:id).include?(Integer(params[:add][:add_academic_degree_id]))
      redirect_to @department, notice: "Academic Degree is already added!"
    else
      degree = AcademicDegree.find(Integer(params[:add][:add_academic_degree_id]))
      @department.academic_degrees << degree
      redirect_to @department, notice: "Academic Degree added successfully!"
    end
  end

  def del_academic_degree
    @department = Department.find(Integer(params[:id]))
    @department.academic_degrees.destroy(AcademicDegree.find(Integer(params[:del][:del_academic_degree_id])))
    redirect_to @department, notice: "Academic Degree removed successfully!"
  end
  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name, :department_type, :department_head_id)
    end
end
