class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
    	t.string :subject
    	t.text :question
    	t.text :optionA
    	t.text :optionB
    	t.text :optionC
    	t.text :optionD
    	t.column :correct_choice, "char(1)"
    	#t.references :question_paper, foreign_key: true
    	t.timestamps
    end
  end
end
