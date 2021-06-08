class AdminCoursesController < ApplicationController
  before_action :set_admin_course, only: [:show, :edit, :update, :destroy]

  # GET /admin_courses
  # GET /admin_courses.json
  def index
    @admin_courses = AdminCourse.all
  end

  # GET /admin_courses/1
  # GET /admin_courses/1.json
  def show
  end

  # GET /admin_courses/new
  def new
    @admin_course = AdminCourse.new
  end

  # GET /admin_courses/1/edit
  def edit
  end

  # POST /admin_courses
  # POST /admin_courses.json
  def create
    @admin_course = AdminCourse.new(admin_course_params)

    respond_to do |format|
      if @admin_course.save
        format.html { redirect_to @admin_course, notice: 'Admin course was successfully created.' }
        format.json { render :show, status: :created, location: @admin_course }
      else
        format.html { render :new }
        format.json { render json: @admin_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_courses/1
  # PATCH/PUT /admin_courses/1.json
  def update
    respond_to do |format|
      if @admin_course.update(admin_course_params)
        format.html { redirect_to @admin_course, notice: 'Admin course was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_course }
      else
        format.html { render :edit }
        format.json { render json: @admin_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_courses/1
  # DELETE /admin_courses/1.json
  def destroy
    @admin_course.destroy
    respond_to do |format|
      format.html { redirect_to admin_courses_url, notice: 'Admin course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_course
      @admin_course = AdminCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_course_params
      params.require(:admin_course).permit(:admin, :user_id, :course_id)
    end
end
