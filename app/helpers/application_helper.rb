module ApplicationHelper
  def fix_url(str)
    str.start_with?("http://") ? str : "http://#{str}"
  end

  def display_datetime(datetime)
    datetime.strftime("%d/%m/%Y %H:%M %P")
  end
end
