# frozen_string_literal: true

class MaterialsController < AdminController
  def index
    @materials = Material.where(lesson_id: params[:lesson_id])
  end

  def new
    @material = Material.new(lesson_id: params[:lesson_id])
  end

  def create
    @material = Material.new(material_params)
    redirect_to topic_lesson_materials_path if @material.save
  end

  def update
  end

  def destroy
  end

  private

  def material_params
    params.require(:material).permit(:type, :body, :order, :lesson_id)
  end
end