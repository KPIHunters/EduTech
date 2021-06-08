require 'rails_helper'

RSpec.describe "admin_courses/index", type: :view do
  before(:each) do
    assign(:admin_courses, [
      AdminCourse.create!(
        admin: false,
        user: nil,
        course: nil
      ),
      AdminCourse.create!(
        admin: false,
        user: nil,
        course: nil
      )
    ])
  end

  it "renders a list of admin_courses" do
    render
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
