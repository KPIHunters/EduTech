require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
        name: "Name",
        video_id: "Video Url",
        period: nil
      ),
      Lesson.create!(
        name: "Name",
        video_id: "Video Url",
        period: nil
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Video Url".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
