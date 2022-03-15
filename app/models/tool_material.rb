# frozen_string_literal: true

class ToolMaterial < Material
  has_rich_text :body

  def title
    'Tools'
  end
end
