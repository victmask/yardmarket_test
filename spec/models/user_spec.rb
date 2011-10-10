require 'spec_helper'

describe User do
  before :each do
    @attr = {:name => "Test user", :email => "testuser@email.com"}
  end

  it "should create new instance given attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
end

  it "should reject names that are too long" do
    long_name = "piece" * 10 + "!"
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    emails = %w[foo@bar.com AT_FOO@foo.bar.org first.last@foo.jp]
    emails.each do |email|
      user = User.new(@attr.merge(:email => email))
      user.should be_valid
    end
  end

  it "should not accept invalid email addresses" do
    emails = %w[foo@barcom,com AT_FOO.foo.bar.org first.last@foo.jp. foo@bar]
    emails.each do |email|
      user = User.new(@attr.merge(:email => email))
      user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    user = User.create!(@attr)
    user_duplicate = User.new(@attr)
    user_duplicate.should_not be_valid
  end

end
