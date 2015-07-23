module ApplicationHelper

  def offset(index)
    index == 0 ? "col-md-offset-1" : ""
  end

  def format_number(num)
    return number_with_precision(num , :precision => 2, :delimiter => ',')
  end

  def format_date(date)
    return date.blank? ? "" : date.strftime("%b %d, %Y")
  end

  def is_active_post(category)
    "active" if category == params[:category]
  end

  def is_active(current)
    "active" if current == params[:controller]
    
  end

  def is_date_visible?
    true if params[:category] == "2"
  end

  def is_excerpt_visible?
    true if params[:category] == "2" || params[:category] == "3"
  end

  def is_current?(current)

    return "current" if params[:controller]  == current
  end

  def is_photo_visible?
    true if params[:category] == "1"
  end

  def is_excerpt_visible?
    true if params[:category] == "2"
  end

  def is_content_visible?
    true if params[:category] == "3"
  end

  def post_label
    case params[:category]
    when "1"
      "Caption"
    when "2"
      "Country"
    end
  end

  def is_title_visible?
    false if params[:category] == "4"
  end




  def is_first?(i)
    return i == 0 ? "active" : ""
  end

  def has_add?
    true if params[:category] == "10" || params[:category] == "11"
  end

  
end
