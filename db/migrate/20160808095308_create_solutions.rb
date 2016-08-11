class CreateSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :solutions do |t|
    	t.references :user, foreign_key: true
    	t.references :question_paper, foreign_key:true
    	t.float :score
      t.timestamps
    end
  end
end
