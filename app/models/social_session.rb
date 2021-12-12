class SocialSession < ApplicationRecord
  # Dependencies
  acts_as_paranoid
  include OAuthProviders

  # Relations
  belongs_to :user

  # Validations
  validates :provider_id, numericality: { less_than_or_equal_to: LINKEDIN_PROVIDER_ID }, presence: true

  # Create Social Session
  def self.create_from_oauth(provider_data, user)
    # Default correct attrs
    _provider_id = nil
    _uid = provider_data[:uid]
    _email = provider_data[:info][:email]
    _access_token = provider_data[:credentials][:token]
    _extra = provider_data[:extra][:raw_info].to_json
    
    # Possible change attrs
    _provider_id = nil
    _picture_url = nil
    _profile_url = nil
    _username = nil
    _bio = nil
    
    if provider_data[:provider] == 'github'
      _provider_id = GITHUB_PROVIDER_ID
      _picture_url = provider_data[:info][:image]
      _profile_url = provider_data[:info][:urls][:GitHub]
      _username = provider_data[:info][:nickname]
      _bio = provider_data[:extra][:raw_info][:bio]
    elsif provider_data[:provider] == 'linkedin'
      _provider_id = LINKEDIN_PROVIDER_ID
      _picture_url = provider_data[:info][:picture_url]
      _profile_url = nil
      _username = nil
      _bio = nil
    end

    social_session_params = {
      uid: _uid,
      username: _username,
      email: _email,
      access_token: _access_token,
      provider_id: _provider_id,
      extra: _extra,
      bio: _bio,
      picture_url: _picture_url,
      profile_url: _profile_url,
      user_id: user.id
    }

    user_providers = JSON.parse(user.providers)
    unless user_providers.include?(_provider_id)
      user_providers << _provider_id
      user.providers = user_providers.to_json 
      user.save
    end

    social_session = SocialSession.where(uid: _uid, provider_id: _provider_id)
    if social_session.take.nil? 
      SocialSession.create!(social_session_params).persisted?
    else
      social_session.update(social_session_params)
    end
  end
end
