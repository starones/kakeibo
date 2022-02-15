class Form::IncomeValue < IncomeValue
  REGISTRABLE_ATTRIBUTES = %i(income_id year_manth value description)
  attr_accessor :income_id
  attr_accessor :year_manth
  attr_accessor :value
  attr_accessor :description
end