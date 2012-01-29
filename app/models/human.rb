class Human < ActiveRecord::Base
  belongs_to :dept, :foreign_key => 'dept_id'
  has_many :salary_histories
  has_many :interview_histories
  validates_inclusion_of :gender, :in => %w( m f ), :message => "woah! what are you then!??!!"
  validates_inclusion_of :marriage_state, :in => %w( unknown married single divorced ), :message => "please specify marriage state"
end
