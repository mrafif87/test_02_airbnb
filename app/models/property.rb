class Property < ActiveRecord::Base
	belongs_to :user
	has_many :property_tags
  	has_many :tags, :through  => :property_tags

  	has_many :user_properties
  	has_many :users, :through => :user_properties
end