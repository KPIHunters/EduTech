require 'rails_helper'

RSpec.describe "subscriptions/index", type: :view do
  before(:each) do
    assign(:subscriptions, [
      Subscription.create!(
        last_lesson: "",
        user: nil,
        course: nil
      ),
      Subscription.create!(
        last_lesson: "",
        user: nil,
        course: nil
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
