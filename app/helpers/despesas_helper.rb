module DespesasHelper
  
  def gerar_despesa_mensal
    @descricao_tipo = DescricaoTipo.where(
        :natureza => ['despesa_condominio', 'despesa_extra'],
        :ativo => true
    )
    @despesas = []
    i = 0
    @descricao_tipo.each do |descricao|
      @despesas << Despesa.new
      @despesas[i].ativo = true
      @despesas[i].data_inclusao = DateTime.now
      @despesas[i].data = DateTime.now
      @despesas[i].natureza = descricao.natureza
      @despesas[i].descricao_tipo = descricao
      if(descricao.valor_fixo)
        @despesas[i].valor = descricao.valor_fixo
      end
      i+=1
    end
  end
  
  
  def calcular_receitas(despesas)
    totalE = 0
    totalD = 0
    despesas.each do |despesa|
      if despesa.natureza == 'despesa_condominio'
        totalD += despesa.valor
      else
        totalE += despesa.valor
      end
    end
    #atualizar dados do condominio
    condominio = Condominio.first
    if condominio.update(saldo: (condominio.saldo - totalD), fundo_reserva: (condominio.fundo_reserva - totalE)) == false
      @sucesso = false
    end
    
    apartamento = Apartamento.where(ativo: true)
    tamanho = apartamento.size
    valor_ap = totalD / tamanho
    descricao_conta = DescricaoTipo.where(nome: 'Conta do Mês').first
    descricao_fundo = DescricaoTipo.where(nome: 'Fundo Reserva').first
    apartamento.each do |ap|
      receita = ReceitaAReceber.new
      receita.ativo = true
      receita.data_inclusao = DateTime.now
      receita.data = DateTime.now
      receita.natureza = 'taxa_condominio'
      receita.descricao_tipo = descricao_conta
      receita.valor = valor_ap
      receita.morador = Morador.where(apartamento_id: ap.id, ativo: true).first
      receita.apartamento = ap
      if receita.save == false
        @sucesso = false
      end
      receita = ReceitaAReceber.new
      receita.ativo = true
      receita.data_inclusao = DateTime.now
      receita.data = DateTime.now
      receita.natureza = 'fundo_reserva'
      receita.descricao_tipo = descricao_fundo
      receita.valor = descricao_fundo.valor_fixo
      receita.morador = Morador.where(apartamento_id: ap.id, ativo: true).first
      receita.apartamento = ap
      if receita.save == false
        @sucesso = false
      end
    end
  end
  def calculo_saldo(despesa, old_valor)
    condominio = Condominio.first
    if old_valor && old_valor != nil
      despesa.valor -= old_valor
    end
    if despesa.ativo
      if despesa.natureza == 'despesa_condominio'
        condominio.update(saldo: condominio.saldo - despesa.valor)
      else
         condominio.update(fundo_reserva: condominio.fundo_reserva - despesa.valor)
      end
    else
      if despesa.natureza == 'despesa_condominio'
        condominio.update(saldo: condominio.saldo + despesa.valor)
      else
         condominio.update(fundo_reserva: condominio.fundo_reserva + despesa.valor)
      end
    end
  end
  
  def verificar_moradores
    @retorno = true
    @ap_problema = []
    apartamento = Apartamento.where(ativo: true)
    apartamento.each do |ap|
      if Morador.where(apartamento_id: ap.id, ativo: true).size < 1
        @retorno = false
        @ap_problema << ap.unidade
      end
    end
    @retorno
  end
  
  
end
