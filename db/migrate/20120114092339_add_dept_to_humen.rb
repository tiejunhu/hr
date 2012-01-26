class AddDeptToHumen < ActiveRecord::Migration
  def change
    add_column :humen, :dept_id, :integer
  end
end
