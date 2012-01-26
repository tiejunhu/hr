class Human < ActiveRecord::Base
  belongs_to :dept, :foreign_key => 'dept_id'
  has_many :salary_histories
  has_many :interview_histories
end
