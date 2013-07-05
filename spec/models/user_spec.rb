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

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  currency               :string(255)      default("$")
#

