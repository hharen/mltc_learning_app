# frozen_string_literal: true

class Reorderer 
  def initialize(object, id_reference, clazz=nil)
    @object = object
    @id_reference = id_reference
    @clazz = clazz || object.class
  end

  def reorder!
    objects_to_reorder = @clazz.where(@id_reference => @object.attributes[@id_reference.to_s], order: (@object.order..))
    objects_to_reorder.reverse.each do |object|
      object.update_column(:order, object.order + 1)
    end
  end
end
