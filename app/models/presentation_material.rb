# frozen_string_literal: true

class PresentationMaterial < Material
  def title
    'Presentation'
  end

  def show_body
    "<iframe src='#{body}/embed?start=false&loop=false&delayms=3000' class='w-full md:w-9/12 h-72 md:h-96' \
    frameborder='0' allowfullscreen='true' mozallowfullscreen='true' webkitallowfullscreen='true'></iframe>"
  end
end
