module ApplicationHelper

  def page_title(title, *args)
    content_for :title, raw("#{strip_tags(title)}")
    content_tag(:h1, raw(title), *args)
  end

  def spanerize(text, *args)
    content_tag(:span, raw(text), *args)
  end

  def format_hour(time)
    time.strftime("%H:%M")
  end

end
