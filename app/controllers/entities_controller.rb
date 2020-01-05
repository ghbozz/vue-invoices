class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    if @entity.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :address, :phone,
                                   :siret, :bic, :iban, :footer)
  end
end
