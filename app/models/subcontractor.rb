class Subcontractor < ActiveRecord::Base
	validates :name,:email, :description, :presence => true
	validates :email, :uniqueness => true
	belongs_to :user

	attr_accessor :password

	after_validation(on: :create) do
		if password == nil
			errors.add(:password)
		end
	end
  end
