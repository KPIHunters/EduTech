require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      name: "MyString",
      video_id: "MyString",
      period: nil
    ))
  end

  it "renders the edit lesson form" do
    render

    assert_select "form[action=?][method=?]", lesson_path(@lesson), "post" do

      assert_select "input[name=?]", "lesson[name]"

      assert_select "input[name=?]", "lesson[video_id]"

      assert_select "input[name=?]", "lesson[period_id]"
    end
  end
end
