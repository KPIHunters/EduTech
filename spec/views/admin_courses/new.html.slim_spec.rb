require 'rails_helper'

RSpec.describe "admin_courses/new", type: :view do
  before(:each) do
    assign(:admin_course, AdminCourse.new(
      admin: false,
      user: nil,
      course: nil
    ))
  end

  it "renders new admin_course form" do
    render

    assert_select "form[action=?][method=?]", admin_courses_path, "post" do

      assert_select "input[name=?]", "admin_course[admin]"

      assert_select "input[name=?]", "admin_course[user_id]"

      assert_select "input[name=?]", "admin_course[course_id]"
    end
  end
end
