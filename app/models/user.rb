class User < ActiveRecord::Base
	has_many :mhds
	has_many :cmds
	has_many :conventions
	has_many :erors
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
