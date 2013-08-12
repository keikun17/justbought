require 'spec_helper'

describe TagValidator do

  describe "validate" do
    subject { Validatable.new }

    context "with hashtags and cashtags" do
      before do
        TagValidator.any_instance.stub(:taggable).and_return(subject)
        TagValidator.any_instance.stub(:have_hashtags?).and_return(true)
        TagValidator.any_instance.stub(:have_cashtags?).and_return(true)
      end

      it { should be_valid }
    end

    context "with cashtag and without hashtag" do
      before do
        TagValidator.any_instance.stub(:taggable).and_return(subject)
        TagValidator.any_instance.stub(:have_hashtags?).and_return(false)
        TagValidator.any_instance.stub(:have_cashtags?).and_return(true)
      end

      it { should_not be_valid }
    end


    context "with hashtag and without cashtag" do
      before do
        TagValidator.any_instance.stub(:taggable).and_return(subject)
        TagValidator.any_instance.stub(:have_hashtags?).and_return(false)
        TagValidator.any_instance.stub(:have_cashtags?).and_return(true)
      end

      it { should_not be_valid }
    end
  end

end

class Validatable
  include ActiveModel::Validations
  validates_with TagValidator
end
