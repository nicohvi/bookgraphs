class Book < ActiveRecord::Base

  has_many :graphs, dependent: :destroy
  has_attached_file :cover
  validates_attachment_content_type :cover, content_type: 'image/jpeg'

  validates_presence_of :title, :length, :published, :author

end
