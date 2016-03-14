module ElementHelpers
  def label(text, type='primary')
    "<span class='label label-#{type}'>#{text}</span>"
  end

  def required
    "<span class='label label-danger'><i class='fa fa-exclamation'></i></span>"
  end

  def attributes_table(header, &block)
    partial('attribute_table', :locals => {:block => block})
  end

  def attribute(name, description, type, default, *flags, &block)
    type = case type
             when :string
               label('String')
             else
               block_given? ? capture(&block) : type
           end
    flags.flatten!

    params = {:name => name, :description => description, :type => type, :default => default, :flags => flags}
    partial('attribute', :locals => params)
  end
end