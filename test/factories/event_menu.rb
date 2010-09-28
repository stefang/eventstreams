Factory.define :event_menu do |event_menu|
  event_menu.item_type        {'StaticItem'} 
  event_menu.title            {'Programme'}
  event_menu.url              {'/tracks'}
  event_menu.event_id         { 0 }
end