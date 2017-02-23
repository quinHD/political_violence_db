module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("acts/form_partials/" + association.to_s.singularize + "_fields", act_organization: builder, index: id)
    end
    link_to(name, "#", class: "add_fields", data: { id: id, fields: fields.gsub("\n", "") })
  end

  def button_to_add_fields(f, type)
    new_object, name = f.object.send("build_#{type}"), "#{type}_fields"
    fields = f.send(name, new_object, child_index: "new_#{type}") do |builder|
      render(name, f: builder)
    end
    tag(button_label[type], class: 'add_fields btn', 'data-field-type': type,
      'data-content': "#{fields}")
  end

  def button_label
    { value:     'Add Value',
      condition: 'Add Condition',
      sort:      'Add Sort',
      grouping:  'Add Condition Group' }.freeze
  end
end
