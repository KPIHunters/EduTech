require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      name: "MyString",
      target: "MyString",
      options: "MyString"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input[name=?]", "question[name]"

      assert_select "input[name=?]", "question[target]"

      assert_select "input[name=?]", "question[options]"
    end
  end
end
