class Shout < ActiveRecord::Base
  validates :body, :presence => true,
                   :length => {:maximum => 140}
  
  scope :most_recent, order("created_at DESC")
end
