module WikisHelper
    def markdown(text)
        mdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
            fenced_code_blocks: true,
            autolink: true
        )
        mdown.render(text).html_safe
    end
end
