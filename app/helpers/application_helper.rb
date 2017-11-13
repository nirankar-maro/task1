module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end

  def login?
    if user_signed_in?
      return true
    else
      return false
    end
  end
end
