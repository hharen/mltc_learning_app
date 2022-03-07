# frozen_string_literal: true

class ResourceMaterial < Material
  has_rich_text :body

  def title
    'Resources'
  end
end
