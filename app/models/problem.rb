class Problem < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name

  validates :user_id, :presence => true
end
