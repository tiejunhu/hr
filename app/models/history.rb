class History < ActiveRecord::Base
  validates_inclusion_of :category, :in => Settings.history_categories, :message => "category is not correct"
end
