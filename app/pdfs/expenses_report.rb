# encoding: utf-8

class ExpensesReport

  attr_writer :townhouse, :begin, :end
  attr_reader :pdf

  def print_pdf
    @pdf = Prawn::Document.new(:page_layout => :portrait)
    @pdf.text @townhouse.name, :align => :center
    @pdf.move_down 20
    table = [['Tipo', 'Descrição', 'Valor']]
    total = 0
    @townhouse.expenses.each do |expense|
      table << [expense.type.name, expense.description, expense.value]
      total += expense.value
    end
    @pdf.table(table, :position => :center) do
      cells.padding = 10
      cells.borders = []
      row(0).borders = [:bottom]
      row(0).font_style = :bold
      row(0).align = :center
      column(0).align = :center
      columns(0..1).borders = [:right]
      row(0).columns(0..1).borders = [:bottom, :right]
    end
    @pdf.text "Total: #{total}", :align => :right
  end

  def save_pdf(filename = 'test.pdf')
    @pdf.render_file filename
  end
end

t = ExpensesReport.new
t.townhouse = Townhouse.first
t.print_pdf
t.save_pdf 'test2.pdf'