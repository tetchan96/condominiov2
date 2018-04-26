class BalancoController < ApplicationController
  include BalancoHelper
  def index
    cal_saldo_anterior
    cal_receitas(2018)
    cal_despesas(2018)
  end
end
