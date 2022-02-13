class FixedcostsController < ApplicationController

  def index
    @fixedcosts = Fixedcost.order(created_at: :asc)
  end

  def new
    @fixedcost = Fixedcost.new
  end

  def show
    @fixedcost = Fixedcost.find(params[:id])
  end

  def edit
    @fixedcost = Fixedcost.find(params[:id])
  end

  def create
    @fixedcost = Fixedcost.new(fixedcost_params)
    if @fixedcost.save
      redirect_to @fixedcost, notice: "収入科目を登録しました。"
    else
      render "new"
    end
  end

  def update
    fixedcost = Fixedcost.find(params[:id])
    fixedcost.update(fixedcost_params)
    redirect_to fixedcost_path(fixedcost.id)
  end

  def destroy
    fixedcost = Fixedcost.find(params[:id])
    fixedcost.destroy
    redirect_to fixedcosts_path, notice: "科目を削除しました。"
  end

  private

  def fixedcost_params
    params.require(:fixedcost).permit(:name, :description)
  end
end
