class Dept < ActiveRecord::Base

  before_save :convert_parent_id

  def convert_parent_id
    self.parent_id = nil if self.parent_id == -1
  end  
  
  acts_as_tree
  has_many :humen
end
