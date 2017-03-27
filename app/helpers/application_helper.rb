module ApplicationHelper
  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true
    }

    extensions = {
      space_after_headers: true
      #quote: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text)
  end
end
