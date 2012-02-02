class Title < ActiveRecord::Base
  has_many :levels, :primary_key => "band", :foreign_key => "band"
end
