require 'spec_helper'

describe TagExtractor do
  let(:string) { "#YOLO #SWAG gotta get that $1000 #thang! 3123"}

  describe 'extract_hashtag' do
    subject(:hash_extractor) { described_class.extract_hashtags(string) }
    it 'extracts words prefixed with #' do
      should include('YOLO', 'SWAG', 'thang')
      should_not include('that')
    end
  end

  describe 'extract_cashtag' do
    subject(:cash_extractor) { described_class.extract_cashtags(string) }
    it 'extracts words prefixed with #' do
      should include('1000')
      should_not include('3123')
    end
  end
end
