module FormHelper

  def label_form_for(object, *args, &block)
    options = args.extract_options!
    form_for(object, *(args << options.merge(builder: LabelFormBuilder)), &block)
  end

  class LabelFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    def input(attribute, options={})
      content_tag(:div, class: 'input') do
        label(attribute) + text_field(attribute, options )
      end
    end

  end

end
