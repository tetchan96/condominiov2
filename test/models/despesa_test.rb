require 'test_helper'

class TemperatureTest < Minitest::Test
  def despesaOk
      despesa = Despesas.new
      despesa.valor = 100
      despesa.DescricaoTipo = DescricaoTipo.first
      despesa.morador = "Nome Morador"
      
      assert despesa.save
      
     
  end



  def despesaErroValor
      despesa = Despesas.new
      despesa.valor = "R$100"
      despesa.DescricaoTipo = DescricaoTipo.first
      despesa.morador = Morador.first
      
      assert_not despesa.save
      
    
  end
  
  def despesaErroValor2
      despesa = Despesas.new
      despesa.valor = 100,00
      despesa.DescricaoTipo = DescricaoTipo.first
      despesa.morador = ""
      assert_not receita.save
      
    
  end


  def despesaErroDescricao
      despesa = Despesas.new
      despesa.valor = R$100
      despesa.DescricaoTipo = ""
      despesa.morador = ""
      
      assert_not receita.save
      
    
  end
  
  def despesaErroMorador
      despesa = Despesas.new
      despesa.valor = 100.00
      despesa.DescricaoTipo = DescricaoTipo.first
      despesa.morador = ""
      assert_not receita.save
      
    
  end
  
end


