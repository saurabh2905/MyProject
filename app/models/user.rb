class User < ApplicationRecord
	validates :email, :presence =>true,
                    :uniqueness=>true
  	validates :password, :presence =>true,
                    :confirmation =>true
  	validates :password_confirmation , :presence => true
  	#validates_confirmation_of :password	
end
