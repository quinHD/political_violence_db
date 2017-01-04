module ActsHelper
  def act_breadcrumbs(tail_element)
    content_tag(:div, class: "breadcrumbs") do
      link_to("Acciones", acts_path) +
      content_tag(:span, class: "separator") { fa_icon "circle" } +
      tail_element
    end
  end
end
