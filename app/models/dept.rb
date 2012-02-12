class Dept < ActiveRecord::Base
  before_save :convert_parent_id

  def convert_parent_id
    self.parent_id = nil if self.parent_id == -1
  end  
  
  acts_as_tree

  has_many :humen
  belongs_to :manager, :class_name => "Human", :foreign_key => :manager_id
  
  def directly_managing_humen
    humen.where(Settings.filters[:manage])
  end
  
  def all_managing_humen
    dept_ids_cond = { :dept_id => (self.leaves << self).collect{ |d| d.id } }
    filter_cond = Settings.filters[:manage]
    Human.where(dept_ids_cond.merge(filter_cond))
  end
end
