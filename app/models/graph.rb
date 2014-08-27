class Graph < ActiveRecord::Base

  belongs_to :book
  has_many :plot_points, dependent: :destroy

  validates_presence_of :book

end
