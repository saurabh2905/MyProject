class QuestionPaper < ApplicationRecord
	validates :subject, uniqueness: true
	has_many :problems, dependent: :destroy
end
