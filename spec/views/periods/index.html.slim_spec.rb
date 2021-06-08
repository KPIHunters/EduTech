require 'rails_helper'

RSpec.describe "periods/index", type: :view do
  before(:each) do
    assign(:periods, [
      Period.create!(
        name: "Name",
        order: 2,
        course: nil
      ),
      Period.create!(
        name: "Name",
        order: 2,
        course: nil
      )
    ])
  end

  it "renders a list of periods" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
