require 'rails_helper'

RSpec.describe "periods/new", type: :view do
  before(:each) do
    assign(:period, Period.new(
      name: "MyString",
      order: 1,
      course: nil
    ))
  end

  it "renders new period form" do
    render

    assert_select "form[action=?][method=?]", periods_path, "post" do

      assert_select "input[name=?]", "period[name]"

      assert_select "input[name=?]", "period[order]"

      assert_select "input[name=?]", "period[course_id]"
    end
  end
end
