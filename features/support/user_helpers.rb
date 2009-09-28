module UserHelpers
  def create_user( options = {})
    default = {
      :username => "subscriber",
      :password => "1234"
    }.merge(options)
    default[:password_confirmation] ||= default[:password]
    default[:email] ||= "#{default[:username]}@somemail.com"
    user = User.create!(default)
    # user.activate!
    user
  end
  
  def log_in_as(user)
    visit "/login"
    fill_in("login", :with => user.username)
    fill_in("password", :with => user.password)
    click_button("Log in")
  end
  
end

World(UserHelpers)
