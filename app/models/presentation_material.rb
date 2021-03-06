# frozen_string_literal: true

class PresentationMaterial < Material
  def title
    'Presentation'
  end

  def show_body
    "<iframe src='#{body}/embed?start=false&loop=false&delayms=3000' class='presentation' \
    frameborder='0' allowfullscreen='true' mozallowfullscreen='true' webkitallowfullscreen='true'></iframe>"
  end
end
