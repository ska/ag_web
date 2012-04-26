module ApplicationHelper
  def admin_title
    base_title = "Admin area MsuM"
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title}"
    end
  end
  
  def title
    base_title = "Mattone su Mattone - Agenzia Immobiliare"
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title}"
    end
  end
  
  def casa_default
    image_tag("thumb_casa.gif", :alt => "default image")
  end
  
end
