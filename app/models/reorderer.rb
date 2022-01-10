# frozen_string_literal: true

class Reorderer
  def initialize(object, id_reference, clazz = nil)
    @object = object
    @id_reference = id_reference
    @clazz = clazz || object.class
  end

  def reorder!
    ActiveRecord::Base.transaction do
      reorder_objects!
    end
  end

  private

  def reorder_objects!
    all_objects = get_all_objects

    if @object.order.nil?
      all_objects << @object
    else
      index = (@object.order - 1).clamp(0, all_objects.length)
      all_objects.insert(index, @object)
    end

    update_records(all_objects)
  end

  def get_all_objects
    id_reference = @object[@id_reference]
    @clazz.where(@id_reference => id_reference).where.not(id: @object.id).order(order: :asc).to_a
  end

  def update_records(all_objects)
    all_objects.each_with_index do |object, index|
      if object.new_record?
        object.order = index + 1
      else
        object.update_column(:order, index + 1)
      end
    end
  end
end
