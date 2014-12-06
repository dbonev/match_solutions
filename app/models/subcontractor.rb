class Subcontractor < ActiveRecord::Base
	validates :name,:email, :description, :link, :skills, :company_size, :location, :presence=> true
	validates :email, :uniqueness => true
	belongs_to :user

	attr_accessor :password

	before_validation(on: :create) do
		if password == nil || password.empty? 
			errors.add(:password)
		end
	end
  end
