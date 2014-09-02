require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

  describe "#navbar_link_to" do
    let(:request) { double('request', fullpath: '/current-path') }
    before(:each) { allow(helper).to receive(:request).and_return request }

    it "generates an anchor tag inside a li tag" do
      result = navbar_link_to "Home", "/some-path"

      expect(result).to have_css 'li a'
    end

    context "when current path is the same as the path argument" do
      it "adds class active to the li tag" do
        result = navbar_link_to "Home", request.fullpath

        expect(result).to have_css 'li.active a'
      end
    end

    context "when current path is different from the path argument" do
      it "it doesn't add any classes to the li tag" do
        result = navbar_link_to "Home", '/some-other-path'

        expect(result).not_to have_css 'li.active a'
      end
    end
  end
end
