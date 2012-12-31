class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  attr_accessible :body

  validates :user_id, :presence => true
  validates :problem_id, :presence => true
  validates :body, :presence => true
end
