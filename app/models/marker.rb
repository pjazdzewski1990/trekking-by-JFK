class Marker < ActiveRecord::Base
	has_many :posts
	
	attr_accessor :name, :url

  validates :name,  :presence => true
  validates :posX,  :presence => true
  validates :posY,  :presence => true
end
