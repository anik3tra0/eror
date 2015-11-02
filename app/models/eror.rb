class Eror < ActiveRecord::Base
	belongs_to :user
	validates :name, :cause, :fix, :description, presence: true
end
