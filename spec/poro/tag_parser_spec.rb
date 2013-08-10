require 'spec_helper'

describe TagParser do

  let(:string) do
    "Just bought a #blackwidow #mechanicalkeyboard, i think it's worth $400"
  end

  describe 'parse' do
    subject(:tag_parser) { described_class.new(raw: string )}

    after do
      tag_parser.parse
    end
    it "should convert hashtags to links" do
      binding.pry
      tag_parser.should_receive(:linkify_hashtags!)
    end

    it "should convert cashtags to labels" do
      tag_parser.should_receive(:labelize_cashtags!)
    end
  end

end
