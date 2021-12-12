module SocialData
  def github
    if @github.nil?
      @github = get_social_session(SocialSession::GITHUB_PROVIDER_ID)
    else
      @github
    end
  end

  def linkedin
    if @linkedin.nil?
      @linkedin = get_social_session(SocialSession::LINKEDIN_PROVIDER_ID)
    else
      @linkedin
    end
  end

  def get_social_session(provider_id)
    self.social_sessions.where(provider_id: provider_id).take
  end
end
