class DefaultMarriageState < ActiveRecord::Migration
  def change
    change_column :humen, :marriage_state, :string, :default => "unknown"
  end
end
