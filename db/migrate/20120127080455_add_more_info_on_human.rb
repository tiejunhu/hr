class AddMoreInfoOnHuman < ActiveRecord::Migration
  def change
    add_column :humen, :gender, :string
    add_column :humen, :birthday, :date
    add_column :humen, :hometown, :string
    add_column :humen, :mobile, :string
    add_column :humen, :home_address, :string
    add_column :humen, :major_skill, :string
    add_column :humen, :other_skills, :string
    add_column :humen, :marriage_state, :string
    add_column :humen, :id_card_no, :string
  end
end
