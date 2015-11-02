class Convention < ActiveRecord::Base
	belongs_to :user
	validates :ctlr, :action, :views, :uri, :description, presence: true
end
