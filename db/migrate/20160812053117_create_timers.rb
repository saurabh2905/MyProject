class CreateTimers < ActiveRecord::Migration[5.0]
  def change
    create_table :timers do |t|
    	t.time :start_time
    	t.time :end_time
    	t.time :time_spent
    	t.references :solution, foreign_key: true
      t.timestamps
    	
    end
  end
end
