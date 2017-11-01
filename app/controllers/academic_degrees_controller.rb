class AcademicDegreesController < ApplicationController
  before_action :set_academic_degree, only: [:show, :edit, :update, :destroy]

  def add_department

    @academic_degree = AcademicDegree.find(Integer(params[:id]))
    if @academic_degree.departments.pluck(:id).include?(Integer(params[:add][:add_department_id]))
      redirect_to @academic_degree, notice: "Department is already added!"
    else
      @academic_degree.departments << Department.find(Integer(params[:add][:add_department_id]))
      redirect_to @academic_degree, notice: "Department added successfully!"
    end
  end

  def del_department
    @academic_degree = AcademicDegree.find(Integer(params[:id]))
    @academic_degree.departments.destroy(Department.find(Integer(params[:del][:del_department_id])))
    redirect_to @academic_degree, notice: "Department removed successfully!"
  end

  def programme_wise

    if request.post?
      @prog = params[:academic_degree][:programme]
    end

  end
  # GET /academic_degrees
  # GET /academic_degrees.json
  def index
    @academic_degrees = AcademicDegree.all
  end

  # GET /academic_degrees/1
  # GET /academic_degrees/1.json
  def show
  end

  # GET /academic_degrees/new
  def new
    @academic_degree = AcademicDegree.new
  end

  # GET /academic_degrees/1/edit
  def edit
  end

  # POST /academic_degrees
  # POST /academic_degrees.json
  def create
    @academic_degree = AcademicDegree.new(academic_degree_params)

    respond_to do |format|
      if @academic_degree.save
        format.html { redirect_to @academic_degree, notice: 'Academic degree was successfully created.' }
        format.json { render :show, status: :created, location: @academic_degree }
      else
        format.html { render :new }
        format.json { render json: @academic_degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_degrees/1
  # PATCH/PUT /academic_degrees/1.json
  def update
    respond_to do |format|
      if @academic_degree.update(academic_degree_params)
        format.html { redirect_to @academic_degree, notice: 'Academic degree was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_degree }
      else
        format.html { render :edit }
        format.json { render json: @academic_degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_degrees/1
  # DELETE /academic_degrees/1.json
  def destroy
    @academic_degree.destroy
    respond_to do |format|
      format.html { redirect_to academic_degrees_url, notice: 'Academic degree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_degree
      @academic_degree = AcademicDegree.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_degree_params
      params.require(:academic_degree).permit(:name, :programme, :min_duration)
    end
end
