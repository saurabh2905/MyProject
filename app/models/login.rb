class Login < ApplicationRecord
	validates :email, :presence =>true,
                    :uniqueness=>true
  	validates :password, :presence =>true,
                    :confirmation =>true
  	validates_confirmation_of :password	
end
