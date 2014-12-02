class User < ActiveRecord::Base
	include UsersHelper
	has_secure_password
	has_one :subcontractor
	has_many :projects
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	
	def is_admin?
		return site_admin_emails.include? email.downcase
	end
end
