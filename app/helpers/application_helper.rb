module ApplicationHelper

  def bootstrap_pill_link_to(label, link_params, html_options = {})
    current = current_page?(link_params)
  
    if current
      html_options[:class] ||= ""
      html_options[:class] << " active "
    end
  
    content_tag(:li, html_options) do
      link_to(label, link_params)
    end
  end
  
  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
