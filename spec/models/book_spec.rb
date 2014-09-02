require 'rails_helper'

RSpec.describe Book, :type => :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:authors) }
  it { should validate_presence_of(:img_url) }
  it { should serialize(:authors).as(Array) }
  it { should ensure_inclusion_of(:state).in_array(Book::STATES) }

  describe "#small_img_url" do
    it "should return img_url with zoom attribute changed to 2" do
      book = Book.new(img_url: 'http://example.com/?zoom=4&id=123')

      expect(book.small_img_url).to eq('http://example.com/?zoom=2&id=123')
    end
  end

  describe "" do
    before do
      @book = Book.create(
        title: 'A title', 
        authors: ['Somone'], 
        img_url: 'http://example.com/?id=321321&zoom=4'
      )
    end

    describe "#mark_as_read" do
      it "changes state to read" do
        @book.mark_as_read

        expect(@book.state).to eq :read
      end
    end

    describe "#mark_as_to_to_read" do
      it "changes state to to_read" do
        @book.mark_as_to_read

        expect(@book.state).to eq :to_read
      end
    end

    describe "#mark_as_to_not_interested" do
      it "changes state to not_interested" do
        @book.mark_as_not_interested

        expect(@book.state).to eq :not_interested
      end
    end
  end
end
