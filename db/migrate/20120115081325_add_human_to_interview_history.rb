class AddHumanToInterviewHistory < ActiveRecord::Migration
  def change
    add_column :interview_histories, :human_id, :integer
  end
end
