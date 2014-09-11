class Graph < ActiveRecord::Base
  include Commentable

  belongs_to :book
  has_many :plot_points, dependent: :destroy

  accepts_nested_attributes_for :plot_points

end
