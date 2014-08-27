class AddSvgToGraph < ActiveRecord::Migration
  def change
    add_column :graphs, :svg, :string
  end
end
