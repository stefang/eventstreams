# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_owner?(owned_object)
    current_user == owned_object.user
  end
  
  def pluralize_no_number(count, singular, plural = nil)
     ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
  end
  
end
