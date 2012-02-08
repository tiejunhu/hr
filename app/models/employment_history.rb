class EmploymentHistory < ActiveRecord::Base
  belongs_to :human
  belongs_to :level
  belongs_to :title
  
  after_save :update_human

  validates_inclusion_of :reason, :in => Settings.employment_change_reasons
  
  def update_human
    if human && Settings.employment_left_enum.include?(reason)
      human.update_attributes(:employment_state => reason)
    end
  end
end
