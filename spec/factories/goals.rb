# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  details    :text
#  private    :boolean          default(FALSE)
#  completed  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

FactoryGirl.define do
  factory :goal do
    title { Faker::Lorem.words(3).join(" ") }
  end
end
