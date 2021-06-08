require 'rails_helper'

RSpec.describe "periods/show", type: :view do
  before(:each) do
    @period = assign(:period, Period.create!(
      name: "Name",
      order: 2,
      course: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
