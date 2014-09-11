class AddCoordinatesToPlotPoints < ActiveRecord::Migration
  def change
    add_column :plot_points, :x, :integer
    add_column :plot_points, :y, :integer
  end
end
