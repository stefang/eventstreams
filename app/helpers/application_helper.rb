# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_owner?(owned_object)
    current_user == owned_object.user
  end
end
