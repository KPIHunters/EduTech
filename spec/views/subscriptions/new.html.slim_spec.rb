require 'rails_helper'

RSpec.describe "subscriptions/new", type: :view do
  before(:each) do
    assign(:subscription, Subscription.new(
      last_lesson: "",
      user: nil,
      course: nil
    ))
  end

  it "renders new subscription form" do
    render

    assert_select "form[action=?][method=?]", subscriptions_path, "post" do

      assert_select "input[name=?]", "subscription[last_lesson]"

      assert_select "input[name=?]", "subscription[user_id]"

      assert_select "input[name=?]", "subscription[course_id]"
    end
  end
end
