class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
    	t.column :submitted_choice ,"char(1)"
    	t.references :solution, foreign_key: true
    	t.references :problem, foreign_key: true
      t.timestamps
    end
  end
end
