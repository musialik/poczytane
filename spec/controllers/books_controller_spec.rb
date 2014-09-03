require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  shared_examples "a book collection" do |action|
    before(:each) { get action }

    it "assigns books" do
      expect(assigns(:books)).not_to be_nil
    end

    it "paginates books by 10" do
      expect(assigns(:books).count).to be <=10
    end

    context "when searching by title" do
      before :each do
        get action, q: { title_cont: "a title that doesn't exist" }
      end

      it "filters books by title" do
        expect(assigns(:books)).to be_empty
      end
    end

    context "when searching by authors" do
      before :each do
        get action, q: { authors_cont: "an author that doesn't exist" }
      end

      it "filters books by authors" do
        expect(assigns(:books)).to be_empty
      end
    end
  end

  shared_examples "state filtering action" do |state|
    before(:each) { get state }

    it "assigns only books marked as #{state}" do
      assigns(:books).each do |book|
        expect(book).to send("be_#{state}")
      end
    end
  end

  before(:each) { 20.times { FactoryGirl.create(:book) } }

  describe "#index" do
    it_behaves_like "a book collection", :index
  end

  describe "#read" do
    it_behaves_like "a book collection", :read
    it_behaves_like "state filtering action", :read
  end

  describe "#to_read" do
    it_behaves_like "a book collection", :to_read
    it_behaves_like "state filtering action", :to_read
  end

  describe "#not_interested" do
    it_behaves_like "a book collection", :not_interested
    it_behaves_like "state filtering action", :not_interested
  end

  describe "#other" do
    it_behaves_like "a book collection", :other
    it_behaves_like "state filtering action", :other
  end
end
