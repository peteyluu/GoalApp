require 'spec_helper'
require 'rails_helper'

feature "CRUD of goals" do
  let(:hello_world) { FactoryGirl.create(:user_hw) }

  before(:each) do
    visit new_session_url
    fill_in "session_username", with: hello_world.username
    fill_in "session_password", with: hello_world.password
    click_on "Sign In"
  end

  feature "the create goal process" do
    it "should have a page for creating a new goal" do
      visit new_goal_url
      expect(page).to have_content "New Goal"
    end

    it "should show the new goal after creation" do
      visit new_goal_url
      fill_in "goal_title", with: "blah blah blah"
      fill_in "goal_details", with: "hello, world!"
      click_on "Create Goal"
      expect(page).to have_content "blah blah blah"
      expect(page).to have_content "Goal saved!"
    end
  end

  feature "the read goals process" do
    before(:each) do
      visit new_goal_url
      fill_in "goal_title", with: "running"
      fill_in "goal_details", with: "at least 3 miles everyday"
      click_on "Create Goal"

      visit new_goal_url
      fill_in "goal_title", with: "sleeping"
      fill_in "goal_details", with: "sleep early guy"
      click_on "Create Goal"

      visit new_goal_url
      fill_in "goal_title", with: "eating"
      fill_in "goal_details", with: "eat healthy"
      click_on "Create Goal"
    end

    it "should list goals" do
      visit goals_url
      expect(page).to have_content "running"
      expect(page).to have_content "sleeping"
      expect(page).to have_content "eating"
    end
  end

  feature "the update goal process" do
    let(:goal) { FactoryGirl.create(:goal) }

    it "should have a page to edit a goal" do
      visit edit_goal_url(goal)
      expect(page).to have_content "Edit Goal"
      expect(page).to have_field "Title"
      expect(page).to have_button "Update Goal"
    end

    before(:each) do
      visit edit_goal_url(goal)
      fill_in "goal_title", with: "code code code"
      fill_in "goal_details", with: "practice practice practice"
      click_on "Update Goal"
    end

    it "should show the updated edit" do
      visit goal_url(goal)
      expect(page).to have_content "code code code"
      expect(page).to have_content "practice practice practice"
    end
  end

  feature "the delete goal process" do
    let(:goal) { FactoryGirl.create(:goal) }

    before(:each) do
      visit new_goal_url
      fill_in "goal_title", with: "run run run"
      fill_in "goal_details", with: "ok ok ok"
      click_on "Create Goal"
    end

    it "should have the delete button on goals url" do
      visit goals_url
      expect(page).to have_button "delete \'run run run\' goal"
    end

    it "should delete the goal from the list of goals" do
      visit goals_url
      click_on "delete \'run run run\' goal"
      expect(page).not_to have_content "run run run"
    end
  end
end
