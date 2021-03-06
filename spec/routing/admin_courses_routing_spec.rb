require "rails_helper"

RSpec.describe AdminCoursesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin_courses").to route_to("admin_courses#index")
    end

    it "routes to #new" do
      expect(get: "/admin_courses/new").to route_to("admin_courses#new")
    end

    it "routes to #show" do
      expect(get: "/admin_courses/1").to route_to("admin_courses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin_courses/1/edit").to route_to("admin_courses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin_courses").to route_to("admin_courses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin_courses/1").to route_to("admin_courses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin_courses/1").to route_to("admin_courses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin_courses/1").to route_to("admin_courses#destroy", id: "1")
    end
  end
end
