# frozen_string_literal: true

class TextMaterial < Material
  has_rich_text :body

  def title
    nil
  end
end
