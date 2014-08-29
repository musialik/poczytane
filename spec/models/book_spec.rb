require 'rails_helper'

RSpec.describe Book, :type => :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:authors) }
  it { should validate_presence_of(:img_url) }
end
