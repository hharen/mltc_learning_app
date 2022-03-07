# frozen_string_literal: true

class MaterialsController < AdminController
  def index
    @materials = Material.where(lesson_id: params[:lesson_id])
    @lesson_name = Lesson.find(params[:lesson_id]).name
    @material = Material.new(lesson_id: params[:lesson_id])
  end

  def new
    @material = Material.new(lesson_id: params[:lesson_id])
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to lesson_materials_path(@material.lesson, @material)
    else
      render 'new'
    end
  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    material = Material.find(params[:id])

    if material.update(material_params)
      redirect_to lesson_materials_path(material.lesson, material)
    else
      render 'edit'
    end
  end

  def destroy
    @material = Material.find(params[:id])

    if @material.destroy
      flash[:success] = 'The @material was removed.'
    else
      flash[:error] = "Unfortunately, the material couldn't be deleted."
    end
    redirect_to lesson_materials_path(@material.lesson, @material)
  end

  private

  def material_params
    params.require(:material).permit(:type, :body, :order, :lesson_id)
  end
end