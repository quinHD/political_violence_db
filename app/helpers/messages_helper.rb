module MessagesHelper
  def flash_message(flash)
    if flash.notice.present?
      content_tag(:span, class: "flash notice") do
        flash.notice
      end
    elsif flash.alert.present?
      content_tag(:span, class: "flash alert") do
        flash.alert
      end
    end
  end
end
