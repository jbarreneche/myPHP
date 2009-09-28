require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  def new_authlogic(attributes = {})
    attributes[:username] ||= 'foo'
    attributes[:email] ||= 'foo@example.com'
    attributes[:password] ||= 'abc123'
    attributes[:password_confirmation] ||= attributes[:password]
    User.new(attributes)
  end
  
  before(:each) do
    User.delete_all
  end
  
  it "should be valid" do
    new_authlogic.should be_valid
  end
  
  it "should require username" do
    new_authlogic(:username => '').should have(1).error_on(:username)
  end
  
  it "should require password" do
    new_authlogic(:password => '').should have(1).error_on(:password)
  end
  
  it "should require well formed email" do
    new_authlogic(:email => 'foo@bar@example.com').should have(1).error_on(:email)
  end
  
  it "should validate uniqueness of email" do
    new_authlogic(:email => 'bar@example.com').save!
    new_authlogic(:email => 'bar@example.com').should have(1).error_on(:email)
  end
  
  it "should validate uniqueness of username" do
    new_authlogic(:username => 'uniquename').save!
    new_authlogic(:username => 'uniquename').should have(1).error_on(:username)
  end
  
  it "should not allow odd characters in username" do
    new_authlogic(:username => 'odd ^&(@)').should have(1).error_on(:username)
  end
  
  it "should validate password is longer than 3 characters" do
    new_authlogic(:password => 'bad').should have(1).error_on(:password)
  end
  
  it "should require matching password confirmation" do
    new_authlogic(:password_confirmation => 'nonmatching').should have(1).error_on(:password)
  end
  
  it "should generate password hash and salt on create" do
    authlogic = new_authlogic
    authlogic.save!
    authlogic.password_hash.should_not be_nil
    authlogic.password_salt.should_not be_nil
  end
  
  it "should authenticate by username" do
    authlogic = new_authlogic(:username => 'foobar', :password => 'secret')
    authlogic.save!
    User.authenticate('foobar', 'secret').should == authlogic
  end
  
  it "should authenticate by email" do
    authlogic = new_authlogic(:email => 'foo@bar.com', :password => 'secret')
    authlogic.save!
    User.authenticate('foo@bar.com', 'secret').should == authlogic
  end
  
  it "should not authenticate bad username" do
    User.authenticate('nonexisting', 'secret').should be_nil
  end
  
  it "should not authenticate bad password" do
    new_authlogic(:username => 'foobar', :password => 'secret').save!
    User.authenticate('foobar', 'badpassword').should be_nil
  end
end
