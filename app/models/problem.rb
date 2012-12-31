class Problem < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name

  validates :user_id, :presence => true

  has_many :comments, :dependent => :destroy

  def self.search(query)
    if query and !query.empty?
      where('name like ? or description like ?', "%#{query}%", "%#{query}%")
    else
      all
    end
  end
end
