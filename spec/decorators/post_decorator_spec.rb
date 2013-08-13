require 'spec_helper'

describe PostDecorator do
  subject { described_class.new(Object.new) }

  describe "parsed_comment" do
    let(:parsed_string) { String.new }

    it "outputs html_safe parsed comment" do
      subject.stub_chain(:parser, :parse).and_return(parsed_string)
      parsed_string.should_receive(:html_safe)
      subject.parsed_comment
    end

  end
end
