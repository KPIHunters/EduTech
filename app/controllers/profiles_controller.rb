class ProfilesController < ApplicationController
  before_action :form_redir, only: [:index, :show]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: t('flash.profiles.create') }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to edit_profile_path(@profile), notice: t('flash.profiles.update') }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    # @profile.destroy
    # respond_to do |format|
    #   format.html { redirect_to profiles_url, notice: 'Seu perfil foi deletado com sucesso.' }
    #   format.json { head :no_content }
    # end
  end

  def delete_account
    unless @current_user.admin
      if @current_user.profile
        @current_user.profile.destroy
      else
        @current_user.destroy
      end
    end

    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      if @current_user.profile.id != params[:id].to_i
        return form_redir
      end

      @profile = Profile.find(params[:id])
    end

    # Redirect to profile form
    def form_redir
      unless @current_user.admin?
        if @current_user.profile.nil?
          redirect_to new_profile_path
        else
          redirect_to edit_profile_path(@current_user.profile)
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      in_params = params.require(:profile).permit(:phone, :state_ibge, :county_ibge, :full_address, :zip_code,
                                      :company_fantasy_name, :company_legal_name, :website, :gov_id_pf, :gov_id_pj,
                                      :facebook_link, :twitter_link, :linkedin_link, :bio, :description, :birthday,
                                      :photo, :banner, :selfie, :legal_doc, :signature, :third_part_receive_equipments,
                                      :bank_agency, :bank_account) #:bank_code,

      in_params[:birthday] = Date.parse(in_params[:birthday]) unless in_params[:birthday].nil? || in_params[:birthday].length == 0
      cpf = CPF.new(params[:profile][:gov_id_pf])
      in_params[:gov_id_pf] = cpf.stripped

      in_params[:phone] = in_params[:phone].gsub(/[^0-9A-Za-z]/, '')
      in_params[:state_ibge] = params[:profile][:state_ibge].split('-')[1].strip() if params[:profile][:state_ibge].index '-'
      in_params[:county_ibge] = params[:profile][:county_ibge].split('-')[1].strip() if params[:profile][:county_ibge].index '-'
      in_params[:user_id] = @current_user.id

      in_params
    end
end
