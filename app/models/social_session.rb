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
    _provider_id = nil
    _uid = provider_data[:uid]
    _username = provider_data[:info][:nickname]
    _email = provider_data[:info][:email]
    _access_token = provider_data[:credentials][:token]
    _extra = provider_data[:extra][:raw_info].to_json
    _bio = provider_data[:extra][:raw_info][:bio]
    
    if provider_data[:provider] == 'github'
      _provider_id = GITHUB_PROVIDER_ID
    end

    social_session_params = {
      uid: _uid,
      username: _username,
      email: _email,
      access_token: _access_token,
      provider_id: _provider_id,
      extra: _extra,
      bio: _bio,
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
