class QuestionPaper < ApplicationRecord
	validates :subject, uniqueness: true
	has_many :problem
end
