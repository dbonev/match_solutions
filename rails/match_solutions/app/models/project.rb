
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
	unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	  record.errors[attribute] << (options[:message] || "is not an email")
	end
  end
end
class Project < ActiveRecord::Base
	validates :name,:email, :description, :presence => true
	validates :email, :email => true
	belongs_to :user
	
	attr_accessor :password

	before_validation(on: :create) do
		if password == nil || password.empty? 
			errors.add(:password)
		end
	end
end
