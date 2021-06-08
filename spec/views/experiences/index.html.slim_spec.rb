require 'rails_helper'

RSpec.describe "experiences/index", type: :view do
  before(:each) do
    assign(:experiences, [
      Experience.create!(
        name: "Name"
      ),
      Experience.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of experiences" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
