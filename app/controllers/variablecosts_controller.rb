class VariablecostsController < ApplicationController
  def index
    @variablecosts = Variablecost.order(created_at: :asc)
  end

  def new
    @variablecost = Variablecost.new
  end

  def show
    @variablecost = Variablecost.find(params[:id])
  end

  def edit
    @variablecost = Variablecost.find(params[:id])
  end

  def create
    @variablecost = Variablecost.new(variablecost_params)
    if @variablecost.save
      redirect_to @variablecost, notice: "収入科目を登録しました。"
    else
      render "new"
    end
  end

  def update
    variablecost = Variablecost.find(params[:id])
    variablecost.update(variablecost_params)
    redirect_to variablecost_path(variablecost.id)
  end

  def destroy
    variablecost = Variablecost.find(params[:id])
    variablecost.destroy
    redirect_to variablecosts_path, notice: "科目を削除しました。"
  end

  private

  def variablecost_params
    params.require(:variablecost).permit(:name, :description)
  end

end
