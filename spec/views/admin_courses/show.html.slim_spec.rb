require 'rails_helper'

RSpec.describe "admin_courses/show", type: :view do
  before(:each) do
    @admin_course = assign(:admin_course, AdminCourse.create!(
      admin: false,
      user: nil,
      course: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
