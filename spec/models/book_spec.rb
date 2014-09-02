require 'rails_helper'

RSpec.describe Book, :type => :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:authors) }
  it { should validate_presence_of(:img_url) }
  it { should serialize(:authors).as(Array) }

  describe "#small_img_url" do
    it "should return img_url with zoom attribute changed to 2" do
      book = Book.new(img_url: 'http://example.com/?zoom=4&id=123')

      expect(book.small_img_url).to eq('http://example.com/?zoom=2&id=123')
    end
  end
end
