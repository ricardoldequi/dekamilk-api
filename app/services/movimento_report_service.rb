# app/services/movimento_report_service.rb
require 'prawn'
require 'prawn/table'

class MovimentoReportService
  def generate_pdf(entradas, saidas, saldo)
    Prawn::Fonts::AFM.hide_m17n_warning = true

    Prawn::Document.new do |pdf|
      pdf.text "Movimentações", size: 18, style: :bold
      pdf.move_down 20

      # Movimentos de Entrada
      pdf.text "Movimentos de Entrada", size: 14, style: :bold
      total_entradas = entradas.sum(:quantidade)
      pdf.text "Total Entrada: #{total_entradas}", size: 12
      generate_table(pdf, entradas)

      pdf.move_down 20

      # Movimentos de Saída
      pdf.text "Movimentos de Saída", size: 14, style: :bold
      total_saidas = saidas.sum(:quantidade)
      pdf.text "Total Saída: #{total_saidas}", size: 12
      generate_table(pdf, saidas)

      pdf.move_down 20

      # Saldo Total
      pdf.text "Saldo: #{saldo}", size: 14, style: :bold
    end.render
  end

  private

  def generate_table(pdf, movimentos)
    table_data = [["ID", "Operação", "Quantidade", "Fornecedor", "Cliente", "Descrição", "Data Lançamento"]]
    movimentos.each do |movimento|
      table_data << [
        movimento.movimento_id,
        movimento.operacao - id,
        movimento.quantidade,
        movimento.fornecedor_id,
        movimento.cliente_id,
        movimento.descricao,
        movimento.data_lancamento.strftime("%d/%m/%Y") # Formata a data
      ]
    end

    pdf.table(table_data, header: true) do |table|
      table.row(0).font_style = :bold
      table.header = true
      table.row_colors = %w[DDDDDD FFFFFF]
    end
  end
end
