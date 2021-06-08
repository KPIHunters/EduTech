require 'rails_helper'

RSpec.describe "periods/edit", type: :view do
  before(:each) do
    @period = assign(:period, Period.create!(
      name: "MyString",
      order: 1,
      course: nil
    ))
  end

  it "renders the edit period form" do
    render

    assert_select "form[action=?][method=?]", period_path(@period), "post" do

      assert_select "input[name=?]", "period[name]"

      assert_select "input[name=?]", "period[order]"

      assert_select "input[name=?]", "period[course_id]"
    end
  end
end
