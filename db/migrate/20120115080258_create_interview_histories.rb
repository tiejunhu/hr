class CreateInterviewHistories < ActiveRecord::Migration
  def change
    create_table :interview_histories do |t|
      t.date :interview_date
      t.integer :interviewer_id
      t.text :words
      t.timestamps
    end
  end
end
