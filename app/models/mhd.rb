class Mhd < ActiveRecord::Base
	belongs_to :user
	validates :ctlr, :mtype, :value, :description, presence: true
end
