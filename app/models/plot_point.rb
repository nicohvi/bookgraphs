class PlotPoint < ActiveRecord::Base

  belongs_to :graph

  validates_presence_of :graph, :name

end
