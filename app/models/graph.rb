class Graph < ActiveRecord::Base
  include Commentable

  belongs_to :book
  has_many :plot_points, dependent: :destroy

  validates_presence_of :book, :name, :description

end
