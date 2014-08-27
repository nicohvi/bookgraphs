class Comment < ActiveRecord::Base
  belongs_to :graph
  belongs_to :plot_point

  validates_presence_of :name, :body
  validate :graph_or_plot_point

  private

  def graph_or_plot_point
    if !(graph.nil? ^ plot_point.nil?)
      errors.add(:base, 'A comment must belong to either a Graph or a Plot Point.')
    end
  end

end
