require 'rails_helper'

RSpec.describe "experiences/new", type: :view do
  before(:each) do
    assign(:experience, Experience.new(
      name: "MyString"
    ))
  end

  it "renders new experience form" do
    render

    assert_select "form[action=?][method=?]", experiences_path, "post" do

      assert_select "input[name=?]", "experience[name]"
    end
  end
end
