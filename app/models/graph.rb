class Graph < ActiveRecord::Base
  include Commentable

  belongs_to :book
  has_many :plot_points, dependent: :destroy

  validates_presence_of :plot_points
  accepts_nested_attributes_for :plot_points

end
