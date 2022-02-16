class FixedcostValuesController < ApplicationController
  def index
    @fixedcosts = Fixedcost.order(created_at: :asc)
    @fixedcost_values = FixedcostValue.order("year_month asc")
  end

  def new
    year_month_day = params[:year_month] + "-01"
    @year_month = year_month_day.to_date

    @fixedcosts = Fixedcost.order(created_at: :asc)
    @form = Form::FixedcostForm.new
  end

  def edit
    @fixedcost_value = FixedcostValue.find(params[:id])
    @fixedcost = Fixedcost.find(@fixedcost_value.fixedcost_id)
  end

  def create
    @form = Form::FixedcostForm.new(fixedcost_form_params)
    if @form.save
      redirect_to fixedcost_values_path, notice: "登録しました。"
    else
      redirect_to fixedcost_values_path, notice: "登録に失敗しました。"
    end
  end

  def fixedcost_form_params
    params
      .require(:form_fixedcost_form)
      .permit(fixedcost_values_attributes: Form::FixedcostValue::REGISTRABLE_ATTRIBUTES)
  end

  def update
    @fixedcost_value = FixedcostValue.find(params[:id])
    if @fixedcost_value.update(fixedcost_value_params)
      redirect_to fixedcost_values_path, notice: "情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @fixedcost_value = FixedcostValue.find(params[:id])
    @fixedcost_value.destroy
    redirect_to fixedcost_values_path, notice: "データを削除しました。"
  end

  private

  def fixedcost_value_params
    params.require(:fixedcost_value).permit(:fixedcost_id, :year_month, :value, :description)
  end

end
