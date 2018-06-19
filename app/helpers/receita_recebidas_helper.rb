module ReceitaRecebidasHelper
  def gerar_receita
    data_atual = DateTime.now
    @receber = ReceitaAReceber.where(
        :ativo => true,
        #:data => Date.new(data_atual.year,data_atual.month,1)..Date.new(data_atual.year,(data_atual >> 1).month,1)
    )
    @receitas = []
    i = 0
    @receber.each do |r|
      receita_existe = ReceitaRecebida.where(receita_a_receber_id: r.id).size
      if(receita_existe < 1)
        @receitas << ReceitaRecebida.new
        @receitas[i].ativo = true
        @receitas[i].data_inclusao = DateTime.now
        @receitas[i].data = DateTime.now
        @receitas[i].receita_a_receber = r
        i+=1
      end
    end
  end
  def somar_receitas(receitas)
    totalE = 0
    totalD = 0
    receitas.each do |receita|
      if receita.receita_a_receber.natureza == 'taxa_condominio'
        totalD += receita.valor
      else
        totalE += receita.valor
      end
    end
    #atualizar dados do condominio
    condominio = Condominio.first
    if condominio.update(saldo: (condominio.saldo + totalD), fundo_reserva: (condominio.fundo_reserva + totalE)) == false
      @sucesso = false
    end
  end
  def calculo_saldo(receita, old_valor)
    condominio = Condominio.first
    if old_valor && old_valor != nil
      receita.valor -= old_valor
    end
    if receita.ativo
      if receita.receita_a_receber.natureza == 'taxa_condominio'
        condominio.update(saldo: condominio.saldo + receita.valor)
      else
         condominio.update(fundo_reserva: condominio.fundo_reserva + receita.valor)
      end
    else
      if receita.receita_a_receber.natureza == 'taxa_condominio'
        condominio.update(saldo: condominio.saldo - receita.valor)
      else
         condominio.update(fundo_reserva: condominio.fundo_reserva - receita.valor)
      end
    end
  end
end
