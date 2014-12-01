class Project < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :place, presence: true
	has_many :quotations, dependent: :destroy
end
