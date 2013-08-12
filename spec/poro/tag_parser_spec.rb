require 'spec_helper'

describe TagParser do

  let(:string) { "Just bought a #blackwidow #mechanicalkeyboard, i think it's worth $100" }
  let(:instance) { described_class.new(raw: string )}

  describe 'parse' do

    it "should convert hashtags to links" do
      instance.should_receive(:linkify_hashtags!)
      instance.parse
    end

    it "should convert cashtags to labels" do
      instance.should_receive(:labelize_cashtags!)
      instance.parse
    end
  end

  describe 'labelize_cashtags!' do
    subject(:markup) { Capybara.string(instance.labelize_cashtags!) }
    it { should have_css("span.label.label-success", string: '$100') }
  end

  describe 'labelize_hashtags!' do
    subject(:markup) { Capybara.string(instance.linkify_hashtags!) }
    it { should have_css('a', string: 'blackwidow') }
    it { should have_css('a', string: 'mechanicalkeyboard') }
  end

end
