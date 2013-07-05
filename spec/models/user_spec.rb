require 'spec_helper'

describe User do

  it "has valid factory" do
    user = FactoryGirl.create(:user)
    user.should be_valid
  end


  context "Follows X, not Following Y" do
    let(:me) { FactoryGirl.create(:user, email: 'me@email.com')  }
    let(:x) { FactoryGirl.create(:user, email: 'x@email.com')  }
    let(:y) { FactoryGirl.create(:user, email: 'y@email.com')  }

    before(:each) do
      me.follow(x)
    end

    subject { me }
    it { should be_friends_with(x) }
    it { should_not be_friends_with(y) }

  end
end
