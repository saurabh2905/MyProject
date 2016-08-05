class AddForeignKey < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :problems, :question_papers
  end
end
