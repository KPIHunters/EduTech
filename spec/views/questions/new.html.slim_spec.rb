require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      name: "MyString",
      target: "MyString",
      options: "MyString"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[name]"

      assert_select "input[name=?]", "question[target]"

      assert_select "input[name=?]", "question[options]"
    end
  end
end
