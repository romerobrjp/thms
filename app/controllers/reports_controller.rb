class ReportsController < ApplicationController
  def monthly
    @townhouse = Townhouse.find(1)
    @expenses = Array.new
    @townhouse.expense_types.each do |et|
      @expenses << [et.name, et.total_value_per_month.to_f]
    end
  end
end
