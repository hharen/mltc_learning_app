# frozen_string_literal: true

class TaskMaterial < Material
  has_rich_text :body

  def title
    'Your tasks'
  end
end
