ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /<(input|label|textarea|select)/
    error_class = 'error'

    doc = Nokogiri::HTML::DocumentFragment.parse(html_tag)
    doc.children.each do |node|
      if node.name == 'label'
        span = Nokogiri::XML::Node.new "span", doc
        span['class'] = "notice notice-danger"
        span.content = instance.error_message.uniq.join(', ')
        node.add_child(span)
      end
      unless node['type'] == 'hidden'
        unless node['class'] =~ /\berror\b/
          node['class'] = "#{node['class']} error".strip
        end
      end
    end

    doc.to_html.html_safe
  else
    html_tag
  end
end
