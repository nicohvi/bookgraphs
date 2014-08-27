class AddReferencesToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :graph, index: true
    add_reference :comments, :plot_point, index: true
  end
end
