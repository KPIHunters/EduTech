class OAuthConfigsController < ApplicationController
  before_action :set_oauth_config, only: %i[ show edit update destroy ]

  # GET /oauth_configs or /oauth_configs.json
  def index
    @oauth_configs = OAuthConfig.all
  end

  # GET /oauth_configs/1 or /oauth_configs/1.json
  def show
  end

  # GET /oauth_configs/new
  def new
    @oauth_config = OAuthConfig.new
  end

  # GET /oauth_configs/1/edit
  def edit
  end

  # POST /oauth_configs or /oauth_configs.json
  def create
    @oauth_config = OAuthConfig.new(oauth_config_params)

    respond_to do |format|
      if @oauth_config.save
        format.html { redirect_to @oauth_config, notice: "OAuth config was successfully created." }
        format.json { render :show, status: :created, location: @oauth_config }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oauth_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oauth_configs/1 or /oauth_configs/1.json
  def update
    respond_to do |format|
      if @oauth_config.update(oauth_config_params)
        format.html { redirect_to @oauth_config, notice: "OAuth config was successfully updated." }
        format.json { render :show, status: :ok, location: @oauth_config }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oauth_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oauth_configs/1 or /oauth_configs/1.json
  def destroy
    @oauth_config.destroy
    respond_to do |format|
      format.html { redirect_to oauth_configs_url, notice: "OAuth config was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oauth_config
      @oauth_config = OAuthConfig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oauth_config_params
      params.require(:oauth_config).permit(:provider, :provider_app_id, :provider_app_secret, :scope)
    end
end
