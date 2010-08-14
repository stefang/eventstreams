Then /^"([^"]*)" should not exist$/ do |element|
  assert_select element, 0
end