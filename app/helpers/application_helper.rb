module ApplicationHelper
  def admin_title
    base_title = "Admin area MsuM"
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title}"
    end
  end
end
