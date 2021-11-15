# frozen_string_literal: true

class Reorderer
  def initialize(object, id_reference, clazz = nil)
    @object = object
    @id_reference = id_reference
    @clazz = clazz || object.class
  end

  def reorder!
    id_reference = @object[@id_reference]

    if @object.order.nil?
      @object.order = @clazz.unscoped.where(@id_reference => id_reference).maximum(:order) + 1
      @object.save
    else
      objects_to_reorder = @clazz.where(@id_reference => id_reference, order: (@object.order..))
      objects_to_reorder.reverse.each do |object|
        object.update_column(:order, object.order + 1)
      end
    end
  end
end
