class User < ApplicationRecord
	has_many :solutions
	validates :email, :presence =>true,
                    :uniqueness=>true
  	validates :password, :presence =>true,
                    :confirmation =>true
  	validates :password_confirmation , :presence => true
end
