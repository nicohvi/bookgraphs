module FormHelper

  def label_form_for(object, *args, &block)
    options = args.extract_options!
    form_for(object, *(args << options.merge(builder: LabelFormBuilder)), &block)
  end

  class LabelFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Context

    def input(attribute, options={})
      content_tag(:div, class: 'input') do
        label(attribute) + text_field(attribute, options)
      end
    end

    def submit(*args)
      options = args.extract_options!

      content_tag(:button, type: 'submit') do
        content_tag(:i, "", class: "fa fa-#{options[:icon]} fa-2x") +
        content_tag(:span) do
          options[:text]
        end
      end

    end

  end

end
