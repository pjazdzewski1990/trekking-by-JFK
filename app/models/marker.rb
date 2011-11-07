class Marker < ActiveRecord::Base
	has_many :posts
	
	attr_accessor :name, :url
end
