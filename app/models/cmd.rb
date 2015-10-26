class Cmd < ActiveRecord::Base
	belongs_to :user

	searchable do
		text :name

	end
end