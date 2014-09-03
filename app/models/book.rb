class Book < ActiveRecord::Base
  STATES = [nil, 'read', 'to_read', 'not_interested']
  validates :title, :authors, :img_url, presence: true
  validates :state, inclusion: STATES
  serialize :authors, Array
  
  scope :read, -> { where(state: 'read') }
  scope :to_read, -> { where(state: 'to_read') }
  scope :not_interested, -> { where(state: 'not_interested') }
  scope :other, -> { where(state: nil) }

  def small_img_url
    img_url.gsub(/zoom=\d+/, 'zoom=2')
  end

  def list_authors
    authors.join(', ')
  end

  def mark_as_read
    update_attribute(:state, 'read')
  end

  def mark_as_to_read
    update_attribute(:state, 'to_read')
  end

  def mark_as_not_interested
    update_attribute(:state, 'not_interested')
  end

  def read?
    state == 'read'
  end

  def to_read?
    state == 'to_read'
  end

  def not_interested?
    state == 'not_interested'
  end

  def other?
    state.nil?
  end
end
