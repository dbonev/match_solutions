class Project < ActiveRecord::Base
	validates :name,:email, :description, :presence => true
#	validates :email, :email => true
end
