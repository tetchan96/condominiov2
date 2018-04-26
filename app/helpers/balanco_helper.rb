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
      receita_a_recebers: {
        :data => Date.new(ano,1,1)..Date.new(ano+1,1,1), 
        :natureza => 'taxa_condominio',
        :ativo => true
      }
      ).uniq
  end
  def consultar_receitas_por_descricao_data descricao, ano, mes
    listReceitaAReceber = ReceitaAReceber.where(
        :data => Date.new(ano,mes,1)..Date.new(mes!=12 ? ano : ano+1,mes!=12 ? mes+1 : 1,1),
        :descricao_tipo_id => descricao.id,
        :natureza => 'taxa_condominio',
        :ativo => true
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
    @lista_receitas_total = [0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    consultar_descricao_receitas_ano(ano).each do |value|
      array = []
      array[0]=consultar_receitas_por_descricao_data(value, ano, 1)
      array[1]=consultar_receitas_por_descricao_data(value, ano, 2)
      array[2]=consultar_receitas_por_descricao_data(value, ano, 3)
      array[3]=consultar_receitas_por_descricao_data(value, ano, 4)
      array[4]=consultar_receitas_por_descricao_data(value, ano, 5)
      array[5]=consultar_receitas_por_descricao_data(value, ano, 6)
      array[6]=consultar_receitas_por_descricao_data(value, ano, 7)
      array[7]=consultar_receitas_por_descricao_data(value, ano, 8)
      array[8]=consultar_receitas_por_descricao_data(value, ano, 9)
      array[9]=consultar_receitas_por_descricao_data(value, ano, 10)
      array[10]=consultar_receitas_por_descricao_data(value, ano, 11)
      array[11]=consultar_receitas_por_descricao_data(value, ano, 12)
      soma = 0
      array.each do |valor|
        soma += valor
      end
      array[12] = soma
      i = 0
      @lista_receitas_total.each do |total|
        total += array[i]
        @lista_receitas_total[i]=total
        i+=1
      end
      @list_receitas[index]=[value, array]
      index+=1
    end
  end
  
  
  def consultar_descricao_despesas_ano ano
    DescricaoTipo.joins(:despesa).where(
      despesas: {
        :data => Date.new(ano,1,1)..Date.new(ano+1,1,1), 
        :natureza => 'despesa_condominio',
        :ativo => true
      }
      ).uniq
  end
  def consultar_despesas_por_descricao_data descricao, ano, mes
    listDespesa = Despesa.where(
        :data => Date.new(ano,mes,1)..Date.new(mes!=12 ? ano : ano+1,mes!=12 ? mes+1 : 1,1),
        :descricao_tipo_id => descricao.id,
        :natureza => 'despesa_condominio',
        :ativo => true
      ).uniq
      soma = 0
      listDespesa.each do |value|
        soma+= BigDecimal.new(value.valor)
      end
      return soma
  end
  
  def cal_despesas ano
    @list_despesas = [] 
    index = 0
    @lista_despesas_total = [0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    consultar_descricao_despesas_ano(ano).each do |value|
      array = []
      array[0]=consultar_despesas_por_descricao_data(value, ano, 1)
      array[1]=consultar_despesas_por_descricao_data(value, ano, 2)
      array[2]=consultar_despesas_por_descricao_data(value, ano, 3)
      array[3]=consultar_despesas_por_descricao_data(value, ano, 4)
      array[4]=consultar_despesas_por_descricao_data(value, ano, 5)
      array[5]=consultar_despesas_por_descricao_data(value, ano, 6)
      array[6]=consultar_despesas_por_descricao_data(value, ano, 7)
      array[7]=consultar_despesas_por_descricao_data(value, ano, 8)
      array[8]=consultar_despesas_por_descricao_data(value, ano, 9)
      array[9]=consultar_despesas_por_descricao_data(value, ano, 10)
      array[10]=consultar_despesas_por_descricao_data(value, ano, 11)
      array[11]=consultar_despesas_por_descricao_data(value, ano, 12)
      soma = 0
      array.each do |valor|
        soma += valor
      end
      array[12] = soma
      i = 0
      @lista_despesas_total.each do |total|
        total += array[i]
        @lista_despesas_total[i]=total
        i+=1
      end
      @list_despesas[index]=[value, array]
      index+=1
    end
  end
  
  
end
