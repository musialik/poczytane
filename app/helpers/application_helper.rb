module ApplicationHelper
  def navbar_link_to text, path
    html_class = 'active' if path == request.fullpath.split('?').first
    content_tag :li, class: html_class do
      link_to text, path
    end
  end
end
