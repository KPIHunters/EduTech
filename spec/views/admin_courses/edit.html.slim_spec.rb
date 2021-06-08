require 'rails_helper'

RSpec.describe "admin_courses/edit", type: :view do
  before(:each) do
    @admin_course = assign(:admin_course, AdminCourse.create!(
      admin: false,
      user: nil,
      course: nil
    ))
  end

  it "renders the edit admin_course form" do
    render

    assert_select "form[action=?][method=?]", admin_course_path(@admin_course), "post" do

      assert_select "input[name=?]", "admin_course[admin]"

      assert_select "input[name=?]", "admin_course[user_id]"

      assert_select "input[name=?]", "admin_course[course_id]"
    end
  end
end
