class Level < ActiveRecord::Base
  has_many :titles, :primary_key => "band", :foreign_key => "band"
end
