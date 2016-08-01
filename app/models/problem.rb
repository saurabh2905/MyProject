class Problem < ApplicationRecord
	validates :question,:presence =>true,
                    :uniqueness=>true
    validates :optionA , :presence =>true
    validates :optionB , :presence =>true
    validates :optionC , :presence =>true
    validates :optionD , :presence =>true
    validates :correct_choice , :presence =>true
end
