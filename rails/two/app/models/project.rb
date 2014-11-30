class Project < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :place, presence: true
end
