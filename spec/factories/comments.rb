# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.words(3).join(" ") }
  end
end
