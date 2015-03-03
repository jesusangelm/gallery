module ApplicationHelper

  def to_markdown(content)
    sanitize(Kramdown::Document.new(content).to_html)
  end

end
