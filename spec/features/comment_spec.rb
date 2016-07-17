require 'rails_helper'
require 'spec_helper'

feature "the comment process" do
  let!(:hello_world) { FactoryGirl.create(:user_hw) }
  let!(:foo_bar) { FactoryGirl.create(:user_foo) }
  let!(:hw_goal) { FactoryGirl.create(:goal, author: hello_world) }

  before(:each) do
    visit new_session_url
    fill_in "session_username", with: hello_world.username
    fill_in "session_password", with: hello_world.password
    click_on "Sign In"
  end

  feature "the comment form" do
    feature "should show a comment form on a user page" do
      it "should say new comment on a user show page" do
        visit user_url(hello_world)
        expect(page).to have_content "New Comment"
      end

      it "should have a comment text area field" do
        visit user_url(hello_world)
        expect(page).to have_field "Comment"
      end

      it "should have a button to submit the comment" do
        visit user_url(hello_world)
        expect(page).to have_button "Save Comment"
      end
    end

    feature "should show a comment form on a goal page" do
      it "should say new comment on a goal page" do
        visit goal_url(hw_goal)
        expect(page).to have_content "New Comment"
      end

      it "should have a comment text area field" do
        visit goal_url(hw_goal)
        expect(page).to have_field "Comment"
      end

      it "should have a button to submit the comment" do
        visit user_url(hello_world)
        expect(page).to have_button "Save Comment"
      end
    end
  end

  feature "submitting a comment" do
    let!(:user_comment) { FactoryGirl.create(:comment) }

    feature "submit comment on a user" do
      it "should show the comment on a user page after creation" do
        visit user_url(hello_world)
        fill_in "comment_body", with: user_comment.body
        click_on "Save Comment"
        visit user_url(hello_world)
        expect(page).to have_content user_comment.body
      end
    end

    feature "submit comment on a goal" do
      it "should show the comment on a goal page after creation" do
        visit goal_url(hw_goal)
        fill_in "comment_body", with: user_comment.body
        click_on "Save Comment"
        visit goal_url(hw_goal)
        expect(page).to have_content user_comment.body
      end
    end
  end
end
