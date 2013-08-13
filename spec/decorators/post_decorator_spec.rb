require 'spec_helper'

describe PostDecorator do
  let(:decorator) { described_class.new(Object.new) }

  describe "parsed_comment" do
    let(:parsed_string) { String.new }

    after do
      decorator.parsed_comment
    end

    it "outputs html_safe parsed comment" do
      decorator.stub_chain(:parser, :parse).and_return(parsed_string)
      parsed_string.should_receive(:html_safe)
    end

  end
end
