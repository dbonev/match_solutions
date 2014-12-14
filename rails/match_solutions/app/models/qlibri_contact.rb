class QlibriContact < ActiveRecord::Base
	validates :email, :description, :presence => true
end
