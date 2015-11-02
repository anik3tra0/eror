class Cmd < ActiveRecord::Base
	belongs_to :user
	validates :name, :option, :description, presence: true
end
