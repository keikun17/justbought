require 'spec_helper'

describe TagExtractor do
  let(:string) { "#YOLO #SWAG gotta get that $1000 #thang! 3123"}
  let(:tag_extractor) { described_class.new(string) }

  describe 'extract_hashtag' do
    subject { tag_extractor.extract_hashtags }
    it { should include('YOLO', 'SWAG', 'thang') }
    it { should_not include('that') }
  end

  describe 'extract_cashtag' do
    subject { tag_extractor.extract_cashtags }
    it { should include('1000') }
    it { should_not include('3123') }
  end
end
