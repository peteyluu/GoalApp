require 'rails_helper'
require 'spec_helper'

feature "the signup process" do
  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  it "has username after signup" do
    visit new_user_url
    fill_in 'user_username', with: "peter"
    fill_in 'user_password', with: "password"
    click_on "Create User"
    expect(page).to have_content "peter"
  end
end

feature "logging in" do
  let(:hello_world) { FactoryGirl.create(:user_hw) }

  it "shows username on the homepage after login" do
    visit new_session_url
    fill_in 'session_username', with: hello_world.username
    fill_in 'session_password', with: hello_world.password
    click_on "Sign In"
    expect(page).to have_content "hello_world"
  end
end

feature "logging out" do
  let(:foo_bar) { FactoryGirl.create(:user_foo) }

  it "begins with logged out state" do
    visit new_session_url
    expect(page).to have_content "Log In"
  end

  it "doesn't show username on the homepage after logout" do
    visit new_session_url
    fill_in 'session_username', with: foo_bar.username
    fill_in 'session_password', with: foo_bar.password
    click_on "Sign In"
    click_button "Sign Out"
    expect(page).not_to have_content "foo_bar"
  end
end
