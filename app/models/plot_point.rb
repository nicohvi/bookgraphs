class PlotPoint < ActiveRecord::Base
  belongs_to :graph

  validates_presence_of :name, :x, :y

end
