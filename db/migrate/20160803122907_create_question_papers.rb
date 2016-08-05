class CreateQuestionPapers < ActiveRecord::Migration[5.0]
  def change
    create_table :question_papers do |t|
    	t.string :subject
    	t.integer :number
    	t.integer :time_in_minutes
    	t.timestamps
    end
  end
end
