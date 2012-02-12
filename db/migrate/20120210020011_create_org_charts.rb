class CreateOrgCharts < ActiveRecord::Migration
  def change
    create_table :org_charts do |t|
      t.date :effective_date
      t.string :name
      t.text :json
      t.timestamps
    end
  end
end
