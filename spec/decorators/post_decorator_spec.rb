require 'spec_helper'

describe PostDecorator do
  subject { described_class.new(Object.new) }

  describe "parsed_comment" do
    let(:parser) { Object.new }
    let(:parsed_string) { String.new }

    before do
      subject.should_receive(:parser).and_return(parser)
      parser.should_receive(:parse).and_return(parsed_string)
    end

    it "outputs html_safe ofshould_receive the parsed comment" do
      parsed_string.should_receive(:html_safe)
      subject.parsed_comment
    end

  end
end
