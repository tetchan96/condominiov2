require 'test_helper'

class TemperatureTest < Minitest::Test
  def receitaOk
      receita = receita.new
      receita.valor = 100
      receita.DescricaoTipo = DescricaoTipo.first
      receita.morador = "Nome Morador"
      
      assert receita.save
      
     
  end



  def receitatestErro
      receita = Despesas.new
      receita.valor = "R$100"
      receita.DescricaoTipo = DescricaoTipo.first
      receita.morador = Morador.first
      
      assert_not receita.save
      
    
  end


  def receitatestErroDescricao
      receita = Despesas.new
      receita.valor = R$100
      receita.DescricaoTipo = ""
      receita.morador = ""
      
      assert_not receita.save
      
    
  end
  
  def receitaErroMorador
      receita = Despesas.new
      receita.valor = 100,00
      receita.DescricaoTipo = DescricaoTipo.first
      receita.morador = ""
      assert_not receita.save
      
    
  end
  
end


