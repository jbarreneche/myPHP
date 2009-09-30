Given /^only the following tags exist:$/ do |tags|
  Tag.delete_all
  Tag.create!(tags.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) tag$/ do |pos|
  visit tags_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
  
end

Then /^I should see the following tags:$/ do |expected_tags_table|
  expected_tags_table.diff!(table_at('table').to_a)
end
