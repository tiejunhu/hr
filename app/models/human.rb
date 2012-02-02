class Human < ActiveRecord::Base
  belongs_to :dept, :foreign_key => 'dept_id'
  has_many :salary_histories
  has_many :interview_histories
  validates_inclusion_of :gender, :in => %w( m f ), :message => "woah! what are you then!??!!"
  validates_inclusion_of :marriage_state, :in => %w( unknown married single divorced ), :message => "please specify marriage state"
  
  acts_as_authentic do |c|
    c.require_password_confirmation = false
    c.validate_email_field = false
    c.validates_length_of_password_field_options = { :minimum => 1, :if => :should_validate? }
  end
  
  attr_accessor :updating_password

  def should_validate?
    updating_password or new_record?
  end
end
