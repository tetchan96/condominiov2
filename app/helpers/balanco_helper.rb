module BalancoHelper
  
  def cal_saldo_anterior
    @saldo_anterior = []
    @saldo_anterior[0] = 2
    @saldo_anterior[1] = 2
    @saldo_anterior[2] = 3
    @saldo_anterior[3] = 4
    @saldo_anterior[4] = 5
    @saldo_anterior[5] = 6
    @saldo_anterior[6] = 7
    @saldo_anterior[7] = 8
    @saldo_anterior[8] = 9
    @saldo_anterior[9] = 10
    @saldo_anterior[10] = 11
    @saldo_anterior[11] = 12
    @saldo_anterior[12] = @saldo_anterior.inject(0, :+)
  end
  
  def consultar_descricao_receitas_ano ano
    DescricaoTipo.joins(:receita_a_receber).where(
      receita_a_recebers: {:data => Date.new(ano,1,1)..Date.new(ano+1,1,1)}
      ).uniq
  end
  def consultar_receitas_por_descricao_data descricao, ano, mes
    listReceitaAReceber = ReceitaAReceber.where(
        :data => Date.new(ano,mes,1)..Date.new(mes!=12 ? ano : ano+1,mes!=12 ? mes+1 : 1,1),
        :descricao_tipo_id => descricao.id
      ).uniq
      soma = 0
      listReceitaAReceber.each do |value|
        soma+= BigDecimal.new(value.valor)
      end
      return soma
  end
  
  def cal_receitas ano
    @list_receitas = [] 
    index = 0
    consultar_descricao_receitas_ano(ano).each do |value|
      @list_receitas[index]=[value, [
          0=>consultar_receitas_por_descricao_data(value, ano, 1),
          1=>consultar_receitas_por_descricao_data(value, ano, 2),
          2=>consultar_receitas_por_descricao_data(value, ano, 3),
          3=>consultar_receitas_por_descricao_data(value, ano, 4),
          4=>consultar_receitas_por_descricao_data(value, ano, 5),
          5=>consultar_receitas_por_descricao_data(value, ano, 6),
          6=>consultar_receitas_por_descricao_data(value, ano, 7),
          7=>consultar_receitas_por_descricao_data(value, ano, 8),
          8=>consultar_receitas_por_descricao_data(value, ano, 9),
          9=>consultar_receitas_por_descricao_data(value, ano, 10),
          10=>consultar_receitas_por_descricao_data(value, ano, 11),
          11=>consultar_receitas_por_descricao_data(value, ano, 12)
        ]]
        soma = BigDecimal.new(0)
        @list_receitas[index][1].each do |value|
          puts 'teste'
          puts value
          soma+=value
        end
        puts soma
    end
    
  end
  
  
end
