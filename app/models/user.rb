class User < ActiveRecord::Base
	has_many :properties#, class_name:"Property", foreign_key: ""

	has_many :user_properties
  	has_many :properties, :through => :user_properties
	# validates_uniqueness_of :email
	# validates_presence_of :email, :name

	def self.authenticate(email, password)
		begin
			user = self.find_by_email(email)
		rescue
			user = nil
		ensure
			return user if not user.nil? and email == user.email and password == user.password
		end
		nil
	end
end
