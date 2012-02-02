class RemoveFieldsFromTitle < ActiveRecord::Migration
  def change
    remove_column :titles, :salary_from
    remove_column :titles, :salary_to
  end
end
