class BalancoController < ApplicationController
  include BalancoHelper
  def index
  end
  def relatorio
    cal_saldo_anterior
    cal_receitas(params["ano"].to_f)
    cal_despesas(params["ano"].to_f)
  end
  def new
  end
  def update
  end
end
