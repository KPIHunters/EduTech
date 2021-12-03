require "rails_helper"

RSpec.describe OAuthConfigsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/oauth_configs").to route_to("oauth_configs#index")
    end

    it "routes to #new" do
      expect(get: "/oauth_configs/new").to route_to("oauth_configs#new")
    end

    it "routes to #show" do
      expect(get: "/oauth_configs/1").to route_to("oauth_configs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/oauth_configs/1/edit").to route_to("oauth_configs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/oauth_configs").to route_to("oauth_configs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/oauth_configs/1").to route_to("oauth_configs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/oauth_configs/1").to route_to("oauth_configs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/oauth_configs/1").to route_to("oauth_configs#destroy", id: "1")
    end
  end
end
