class Book < ActiveRecord::Base
  STATES = [:read, :to_read, :not_interested]
  validates :title, :authors, :img_url, presence: true
  serialize :authors, Array

  def small_img_url
    img_url.gsub(/zoom=\d+/, 'zoom=2')
  end
end
