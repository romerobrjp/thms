# encoding: utf-8

class TenantsReport

  attr_writer :townhouse
  attr_reader :pdf

  def print_pdf
    @pdf = Prawn::Document.new(:page_layout => :landscape)
    @pdf.text @townhouse.name, :align => :center
    @pdf.move_down 20
    table = [['Imóvel', 'Nome', 'Endereço de correspondência']]
    @townhouse.tenements.each do |tenement|
      table << [tenement.location, tenement.tenant.name, tenement.tenant.address.full_address]
    end
    @pdf.table(table) do
      cells.padding = 10
      cells.borders = []
      row(0).borders = [:bottom]
      row(0).font_style = :bold
      row(0).align = :center
      column(0).align = :center
      columns(0..1).borders = [:right]
      row(0).columns(0..1).borders = [:bottom, :right]
    end
  end

  def save_pdf(filename = 'test.pdf')
    @pdf.render_file filename
  end
end

t = TenantsReport.new
t.townhouse = Townhouse.first
t.print_pdf
t.save_pdf