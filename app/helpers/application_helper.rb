module ApplicationHelper
  # Must return it product name
  def product_name
    t('descriptions.product_name').html_safe
  end

  def product_name_short
    t('descriptions.product_name').split('. ')[0]
  end

  # Must return it app name based on user locale (default is pt-BR)
  def app_name
    #'Libertaria.Tech'
    'Edu KPI Hunters'
  end

  # Must return ittem app slogan phrase based on user locale (default is pt-BR)
  def slogan
    # 'A maneira mais fácil de pré-qualificar ao Atlas.'
    ''
  end

  # Return it app_name with it slogan
  def app_name_slogan
    "#{app_name} - #{slogan}"
  end

  def app_footer_description
    "#{app_name} - #{slogan}"
  end

  # Check if it page allow default card
  def card_page?
    current_act = params[:action]
    current_ctrl = params[:controller]
    dashboard_ctrl = (current_ctrl == 'dashboard' || current_ctrl == 'profiles')
    courses_card_act = (current_ctrl == 'courses' && current_act == 'index')
    courses_card_act = false # TODO remove me
    !(dashboard_ctrl || courses_card_act) # || degree_card_act
  end

  def company_footer_description
    "Copyright© & Registered® #{Date.today.year}."
  end

  # Return the current screen Title/Header name: CONTROLLER / ACTION
  def screen_name
    controller_name = t("controllers.#{params[:controller]}").upcase
    action_name = t("actions.controllers.#{params[:action]}").upcase
    "#{controller_name} / #{action_name}"
  end

  def read_only?
    params[:action] == 'show'
  end

  def staff_role?
    @current_user.admin? #|| @current_user.moderator?
  end

  def teacher_role?
    #@current_user.teacher?
  end

  def admin?
    @current_user.admin?
  end

  def publisher?
    @current_user.role_id == Role::PUBLISHER 
  end

  def buyer?
    @current_user.role_id == Role::BUYER
  end

  def affiliate?
    @current_user.role_id == Role::AFFILIATE
  end

  def current_page_includes?(path)
    !request.fullpath.index(path).nil?
  end

  def sidebar_nav_open(period)
    params[:controller] == 'lessons' and !@lesson.nil? and @lesson.period_id == period.id
  end

  def autocomplete_format_state(ibge)
    formatted = []
    # ibge.each {|ib| formatted << "#{ib[:code]} - #{ib[:state_name]}"}
    ibge.each {|ib| formatted << "#{ib[:state_name]} - #{ib[:code]}"}
    formatted
  end

  def autocomplete_format_county(ibge)
    formatted = []
    # ibge.each {|ib| formatted << "#{ib[:full_code]} - #{ib[:name]}"}
    ibge.each {|ib| formatted << "#{ib[:name]} - #{ib[:full_code]}"}
    formatted
  end

  def default_action_path
    action = params[:action]
    case action
    when 'index'
      "new_#{params[:controller].singularize}_path"
    when 'show'
      "edit_#{params[:controller].singularize}_path"
    else
      nil
    end
  end

  def formatted_date(dt)
    return if dt.nil?

    # TODO add locale validation
    dt.strftime("%d/%m/%Y")
  end

  def error_msg(obj)
    "O salvamento foi impedido por #{pluralize(obj.errors.count, 'erro')}:"
  end
end