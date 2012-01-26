class AddParentToDept < ActiveRecord::Migration
  def change
    add_column :depts, :parent_id, :integer
  end
end
