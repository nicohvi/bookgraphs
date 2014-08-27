class Book < ActiveRecord::Base

  has_many :graphs, dependent: :destroy

  validates_presence_of :title, :length, :published, :author

end
