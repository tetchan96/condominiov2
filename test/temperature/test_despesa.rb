class TemperatureTest < Minitest::Test
  def despesas
      despesa = Despesas.new
      despesa.valor = 100
      despesa.DescricaoTipo = DescricaoTipo.first
      despesa.save
      
    assert true,true;
  end



  def despesatest
      despesa = Despesas.new
      despesa.valor = "R$100"
      despesa.DescricaoTipo = DescricaoTipo.first
      despesa.save
      
    assert false,false;
  end


  def despesa
      despesa = Despesas.new
      despesa.valor = R$100
      despesa.DescricaoTipo = ""
      despesa.save
      
    assert false,false;
  end
  
end

