module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger fade in"> <button type="button" class="close" data-dismiss="alert"><i class="material-icons">clear</i></button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end