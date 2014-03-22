require 'test_helper'

class InterestedUserTest < ActiveSupport::TestCase

  test "an interested user can be created with an e-mail" do
    assert InterestedUser.new(email: 'phillipnelson@gmail.com').save
  end

  test "an interested user must have an email with an at sign" do
    assert_not InterestedUser.new(email: 'phillipnelsongmail.com').save
  end

  test "an interested user can not be created with a badly formed e-mail" do
    assert InterestedUser.new(email: 'phillipnelson@gmail.com').save!
    assert_not InterestedUser.new(email: 'phillipnelson@gmail.com').save
  end
end
