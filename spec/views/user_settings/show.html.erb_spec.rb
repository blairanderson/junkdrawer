require 'rails_helper'

RSpec.describe "user_settings/show", type: :view do
  before(:each) do
    @user_setting = assign(:user_setting, UserSetting.create!(
      :user => nil,
      :account => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
