class Book < ActiveRecord::Base
  STATES = [:read, :to_read, :not_interested]
  validates :title, :authors, :img_url, presence: true
  serialize :authors, Array
end
