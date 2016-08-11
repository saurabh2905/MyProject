class Problem < ApplicationRecord
	belongs_to :question_paper
	validates :question,:presence =>true, :uniqueness =>true
    validates :optionA ,:optionB ,:optionC ,:optionD, :correct_choice, :presence =>true
    
end