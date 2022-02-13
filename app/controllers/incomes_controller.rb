class IncomesController < ApplicationController

  def index
    @incomes = Income.order(created_at: :asc)
  end

  def new
    @income = Income.new
  end

  def show
    @income = Income.find(params[:id])
  end

  def edit
    @income = Income.find(params[:id])
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to @income, notice: "収入科目を登録しました。"
    else
      render "new"
    end
  end

  def update
    income = Income.find(params[:id])
    income.update(income_params)
    redirect_to income_path(income.id)
  end

  def destroy
  end

  private

  def income_params
    params.require(:income).permit(:name, :description)
  end

end
