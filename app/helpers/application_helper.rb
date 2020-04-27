module ApplicationHelper
  def get_flash_class(key)
    if key == "notice"
      return 'alert-info'
    elsif key == "alert"
      return 'alert-danger'
    else
      return ""
    end
  end
end
