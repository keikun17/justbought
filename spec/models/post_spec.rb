require 'spec_helper'

describe Post do

  describe '#check_hashtags' do
  end

  describe '#check_cashtags' do
  end

  describe "#parsed_comment" do
  end

end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  raw_comment :text
#  created_at  :datetime
#  updated_at  :datetime
#  currency    :string(255)      default("$")
#

