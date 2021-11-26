require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        name: "Name",
        target: "Target",
        options: "Options"
      ),
      Question.create!(
        name: "Name",
        target: "Target",
        options: "Options"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Target".to_s, count: 2
    assert_select "tr>td", text: "Options".to_s, count: 2
  end
end
