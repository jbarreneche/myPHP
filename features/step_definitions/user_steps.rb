Given /^a user is logged in as "([^\"]*)"$/ do |username|
  @current_user = create_user( :username => username)
  log_in_as @current_user
end

