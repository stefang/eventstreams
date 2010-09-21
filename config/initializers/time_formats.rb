ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
  :dmy_long => Proc.new { |date| "#{date.day.ordinalize} #{date.strftime '%B %Y'}" },
  :form_display => "%d-%m-%Y"
  
)

ActiveSupport::CoreExtensions::Range::Conversions::RANGE_FORMATS.merge!(
  :condensed => Proc.new do |start, stop|
    if (start.year == stop.year) and (start.month == stop.month)
      "#{start.day.ordinalize} - #{stop.to_date.to_s(:dmy_long)}"
    else
      "#{start.to_date.to_s(:dmy_long)} to #{stop.to_date.to_s(:dmy_long)}"
    end
  end
)

Time::DATE_FORMATS[:header] = "%d %B"
Time::DATE_FORMATS[:year] = "%Y"
