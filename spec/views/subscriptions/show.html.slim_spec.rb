require 'rails_helper'

RSpec.describe "subscriptions/show", type: :view do
  before(:each) do
    @subscription = assign(:subscription, Subscription.create!(
      last_lesson: "",
      user: nil,
      course: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
