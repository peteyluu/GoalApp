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

class Goal < ActiveRecord::Base
  include Commentable

  validates :title, presence: true, length: { minimum: 6 }
  validates :private, inclusion: [true, false]
  validates :completed, inclusion: [true, false]

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
end
