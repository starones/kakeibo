class IncomeValuesController < ApplicationController
  def index
    @incomes = Income.order(created_at: :asc)
    @income_values = IncomeValue.order("year_manth asc")
  end
  
  def show
    @income_value = IncomeValue.find(params[:id])
  end
  
  def new
    year_manth_day = params[:year_manth] + "-01"
    @year_manth = year_manth_day.to_date
    
    @incomes = Income.order(created_at: :asc)
    @form = Form::IncomeForm.new
  end
  
  def edit
    @income_value = IncomeValue.find(params[:id])
    @income = Income.find(@income_value.income_id)
  end
  
  def create
    @form = Form::IncomeForm.new(income_form_params)
    if @form.save
      redirect_to income_values_path, notice: "登録しました。"
    else
      redirect_to income_values_path, notice: "登録に失敗しました。"
  end
  
  def income_form_params
    params
      .require(:form_incom_form)
      .permit(income_values_attributes: Form::IncomeValue::REGISTRABLE_ATTRIBUTES)
  end
  
  def update
    @income_value = IncomeValue.find(params[:id])
    @income_value.assign_attributes(params[:income_value])
    if @income_value.save
      redirect_to income_values_path, notice: "情報を更新しました。"
    else
      render "edit"
    end
  end
  
  def destroy
    @income_value = IncomeValue.find(params[:id])
    @income_value.destroy
    redirect_to income_values_path, notice: "情報を削除しました。"
  end
  
end
