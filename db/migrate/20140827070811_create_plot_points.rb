class CreatePlotPoints < ActiveRecord::Migration
  def change
    create_table :plot_points do |t|
      t.string :name
      t.integer :page
      t.text :description
      t.references :graph

      t.timestamps 
    end
  end
end
