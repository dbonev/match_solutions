class Subcontractor < ActiveRecord::Base
	validates :name,:email, :description, :password, :presence => true
	validates :email, :uniqueness => true
	belongs_to :user

	attr_accessor :password
end
