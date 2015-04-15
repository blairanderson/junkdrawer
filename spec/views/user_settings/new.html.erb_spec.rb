require 'rails_helper'

RSpec.describe "user_settings/new", type: :view do
  before(:each) do
    assign(:user_setting, UserSetting.new(
      :user => nil,
      :account => ""
    ))
  end

  it "renders new user_setting form" do
    render

    assert_select "form[action=?][method=?]", user_settings_path, "post" do

      assert_select "input#user_setting_user_id[name=?]", "user_setting[user_id]"

      assert_select "input#user_setting_account[name=?]", "user_setting[account]"
    end
  end
end
