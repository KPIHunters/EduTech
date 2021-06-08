require 'rails_helper'

RSpec.describe "subscriptions/edit", type: :view do
  before(:each) do
    @subscription = assign(:subscription, Subscription.create!(
      last_lesson: "",
      user: nil,
      course: nil
    ))
  end

  it "renders the edit subscription form" do
    render

    assert_select "form[action=?][method=?]", subscription_path(@subscription), "post" do

      assert_select "input[name=?]", "subscription[last_lesson]"

      assert_select "input[name=?]", "subscription[user_id]"

      assert_select "input[name=?]", "subscription[course_id]"
    end
  end
end
