class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
    	t.string :question
    	t.string :optionA
    	t.string :optionB
    	t.string :optionC
    	t.string :optionD
    	t.column :correct_choice ,"char(1)"
      t.timestamps
    end
  end
end
