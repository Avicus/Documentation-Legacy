module ElementHelpers
  def label(text, type = 'primary')
    content_tag :span, :class => "label label-#{type}" do
      text
    end
  end

  def attribute_table(header, &block)
    partial('attribute_table', :locals => {:header => header, :block => block})
  end

  def element_table(header, &block)
    partial('element_table', :locals => {:header => header, :block => block})
  end

  def attribute(name, description, type, default = nil, *flags, &block)
    type = case type
             when :string
               label('String')
             when :integer
               label('Integer')
             when :number
               label('Number')
             when :id
               label('ID')
             else
               block_given? ? capture(&block) : label(type)
           end
    flags.flatten!

    if description.is_a?(Array)
      main = description[0]
      note = description[1]
      description = main
      description += '<br />' + content_tag(:i, note)
    end

    params = {:name => name, :description => description, :type => type, :default => default, :flags => flags}
    partial('attribute', :locals => params)
  end

  def attribute_id(name = 'id')
    attribute(name, 'The unique identifier used to reference this element from elsewhere.', :string, nil, :required)
  end
end