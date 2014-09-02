class Book < ActiveRecord::Base
  STATES = [nil, :read, :to_read, :not_interested]
  validates :title, :authors, :img_url, presence: true
  validates :state, inclusion: STATES
  serialize :authors, Array

  def small_img_url
    img_url.gsub(/zoom=\d+/, 'zoom=2')
  end

  def list_authors
    authors.join(', ')
  end

  def mark_as_read
    update_attribute(:state, :read)
  end

  def mark_as_to_read
    update_attribute(:state, :to_read)
  end

  def mark_as_not_interested
    update_attribute(:state, :not_interested)
  end
end
