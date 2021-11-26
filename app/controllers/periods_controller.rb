class PeriodsController < ApplicationController
  before_action :set_periods, only: [:show, :edit, :update, :destroy]

  # GET /periods
  # GET /periods.json
  def index
    # @periods = Period.all
  end

  # GET /periods/1
  # GET /periods/1.json
  def show; end

  # GET /periods/new
  def new
    @period = Period.new
  end

  # GET /periods/1/edit
  def edit; end

  # POST /periods
  # POST /periods.json
  def create
    @period = Period.new(periods_params)

    respond_to do |format|
      if @periods.save
        format.html { redirect_to @period, notice: 'Period was successfully created.' }
        format.json { render :show, status: :created, location: @period }
      else
        format.html { render :new }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /periods/1
  # PATCH/PUT /periods/1.json
  def update
    respond_to do |format|
      if @period.update(periods_params)
        format.html { redirect_to @period, notice: 'Period was successfully updated.' }
        format.json { render :show, status: :ok, location: @period }
      else
        format.html { render :edit }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.json
  def destroy
    @periods.destroy
    respond_to do |format|
      format.html { redirect_to periods_url, notice: 'Period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_periods
      @period = Period.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def periods_params
      params.require(:period).permit(:name, :order, :course_id)
    end
end
