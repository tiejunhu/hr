class AddMoreToHuman < ActiveRecord::Migration
  def change
    add_column :humen, :email, :string
    add_column :depts, :manager_id, :integer
  end
end
