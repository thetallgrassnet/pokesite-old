module ApplicationHelper
  def controller_classes
    controller_path.gsub '/', ' '
  end

  def join_title(*args)
    args.join(" | ")
  end

  def display_flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat content_tag(:button, "&times;".html_safe, type: "button", class: "close", data: { dismiss: "alert" }, aria: { label: t("common.close") })
        concat message
      end)
    end
    nil
  end

  def glyphicon(icon, text = nil)
    capture do
      concat content_tag(:span, "", class: "glyphicon glyphicon-#{icon}", aria: { hidden: true })
      concat content_tag(:span, text.nil? ? icon.titleize : text, class: "sr-only")
    end
  end

  private

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
end
