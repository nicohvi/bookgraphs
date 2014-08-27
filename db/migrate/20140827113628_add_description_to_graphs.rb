class AddDescriptionToGraphs < ActiveRecord::Migration
  def change
    add_column :graphs, :description, :text
  end
end
