# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

FactoryGirl.define do
  factory :user do # The name matters. :user factory returns a User object.
    # To generate random names for our test users, we must pass a block that generates the random username string instead of passing the string value it self.
    username { Faker::Internet.user_name }
    password "password"

    factory :user_hw do
      username "hello_world"
    end

    factory :user_foo do
      username "foo_bar"
    end
  end
end
