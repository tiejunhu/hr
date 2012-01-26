class CreateDeptHierarchies < ActiveRecord::Migration
  def change
    create_table :dept_hierarchies, :id => false do |t|
      t.integer  :ancestor_id, :null => false   # ID of the parent/grandparent/great-grandparent/... tag
      t.integer  :descendant_id, :null => false # ID of the target tag
      t.integer  :generations, :null => false   # Number of generations between the ancestor and the descendant. Parent/child = 1, for example.
    end

    # For "all progeny of..." selects:
    add_index :dept_hierarchies, [:ancestor_id, :descendant_id], :unique => true

    # For "all ancestors of..." selects
    add_index :dept_hierarchies, [:descendant_id]
  end
end
