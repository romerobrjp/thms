class DatepickerInput < SimpleForm::Inputs::Base
  def input
    template.content_tag('div', class: 'datetimepicker input-append date') do 
      @builder.text_field(attribute_name,input_html_options) + \
      template.content_tag('span', class: 'add-on') do 
        template.content_tag('i', '' ,'data-time-icon' => 'icon-time', 'data-date-icon' => 'icon-calendar')
      end
    end
  end
end