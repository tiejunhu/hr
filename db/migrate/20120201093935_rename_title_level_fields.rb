class RenameTitleLevelFields < ActiveRecord::Migration
  def change
    rename_column :titles, :title_letter, :band
    rename_column :levels, :title_letter, :band
  end
end
