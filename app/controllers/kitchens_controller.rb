class KitchensController < ApplicationController
  def show
    @kitchen = Kitchen.find(params[:id])
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.new(params.require(:kitchen).permit(:name))
    if @kitchen.save
      redirect_to @kitchen
    else
      flash[:error] = 'Campos com (*) são obrigatórios'
      render :new
    end
  end
end
