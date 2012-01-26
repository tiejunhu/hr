class SalaryHistory < ActiveRecord::Base
  belongs_to :human, :foreign_key => 'human_id'
end
