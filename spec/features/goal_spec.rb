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

  feature "create goals" do
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

  feature "reading goals" do
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

  feature "updating goals" do
    let(:goal) { FactoryGirl.create(:goal) }

    it "should have a page to edit a goal" do
      visit edit_goal_url(goal)
      expect(page).to have_content "Edit Goal"
    end

    it "should render the edited goal on the show page"
  end

  feature "the delete goal process" do
    it "should delete the goal"

    it "should delete the goal from the list of goals"

  end
end
