class Subcontractor < ActiveRecord::Base
	validates :name,:email, :description, :presence => true
end
