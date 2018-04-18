class BalancoController < ApplicationController
  include BalancoHelper
  def index
    cal_saldo_anterior
    cal_receitas(2019)
  end
end
