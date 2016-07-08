module ElementHelpers
  def label(text, type = 'primary')
    content_tag :span, :class => "label label-#{type}" do
      text
    end
  end

  def attribute_table(header, show_default_column = true, rowNames = ["Attribute", "Description", "Type", "Default"], &block)
    partial('attribute_table', :locals => {:header => header, :block => block, :default => show_default_column, :rowNames => rowNames})
  end

  def attribute_row_id(required = true)
    name = attribute_name('id')
    desc = attribute_desc(t('modules.attributes.id'))
    type = attribute_type(:id)
    default = attribute_column

    attribute_row(required) do
      name + desc + type + default
    end
  end

  def attribute_name(name, opts = {})
    attribute_column do
      content_tag(:code, opts) do
        name
      end
    end
  end

  def attribute_desc(desc, note = nil, &block)
    attribute_column do
      if block_given?
        desc + tag(:br) + capture(&block)
      else
        note.nil? ? desc : (desc + tag(:br) + content_tag(:i, note))
      end
    end
  end

  def attribute_type_element(type, text = nil)
    attribute_column do
      case type
        when :team
          label('Element ID') + tag('br') + link(text ? text : 'Team', '/modules/teams')
        when :region
          label('Element ID') + tag('br') + link(text ? text : 'Region', '/modules/regions')
        when :bounded_region
          label('Element ID') + tag('br') + link(text ? text : 'Bounded region', '/modules/regions')
        when :iterable_region
          label('Element ID') + tag('br') + link(text ? text : 'Iterable region', '/modules/regions')
        when :zone
          label('Element ID') + tag('br') + link(text ? text : 'Zone', '/modules/zones')
        when :check
          label('Element ID') + tag('br') + link(text ? text : 'Check', '/modules/checks')
        when :loadout
          label('Element ID') + tag('br') + link(text ? text : 'Loadout', '/modules/loadouts')
        else
          raise "#{type} is not a valid attribute_type_reference"
      end
    end
  end

  def attribute_type(type = nil, &block)
    attribute_column do
      if block_given?
        content_tag :span, :class => 'label label-primary' do
          capture(&block)
        end
      else
        case type
          when :text
            label('Text')
          when :localizable
            label('Localizable Text')
          when :number
            label('Number')
          when :dye
            label('Dye Color')
          when :duration
            label('Duration')
          when :boolean
            label('True/False')
          when :material
            label('Material Matcher')
          when :materials
            label('Multi Material Matcher')
          when :xyz
            label('X, Y, Z')
          when :comparator
            label('Comparator')
          when :id
            label('ID')
          when :player
            label('Player')
          else
            raise "#{type} is not a valid attribute_type"
        end
      end
    end
  end

  def attribute_default(default)
    attribute_column do
      content_tag(:code, default)
    end
  end

  def attribute_row(required = false, &block)
    content_tag(:tr, :class => (required ? 'info' : '')) do
      capture(&block)
    end
  end

  def attribute_column(&block)
    if block_given?
      content_tag(:td) do
        capture(&block)
      end
    else
      content_tag(:td)
    end
  end
end
