class TemperatureTest < Minitest::Test
  def receitatest
      receita = Despesas.new
      receita.valor = 100
      receita.DescricaoTipo = DescricaoTipo.first
      receita.morador = "Nome Morador"
      receita.save
      
    assert true,true;
  end



  def receitatest1
      receita = Despesas.new
      receita.valor = "R$100"
      receita.DescricaoTipo = DescricaoTipo.first
      receita.morador = Morador.first
      receita.save
      
    assert false,false;
  end


  def receitatest2
      receita = Despesas.new
      receita.valor = R$100
      receita.DescricaoTipo = ""
      receita.morador = ""
      receita.save
      
    assert false,false;
  end
  
  def receitatests
      receita = Despesas.new
      receita.valor = 100,00
      receita.DescricaoTipo = DescricaoTipo.first
      receita.morador = ""
      receita.save
      
    assert false,false;
  end
  
end

