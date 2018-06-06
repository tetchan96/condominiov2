module ReceitaRecebidasHelper
  def gerar_receita
    data_atual = DateTime.now
    @receber = ReceitaAReceber.where(
        :ativo => true,
        :data => Date.new(data_atual.year,data_atual.month,1)..Date.new(data_atual.year,(data_atual >> 1).month,1)
    )
    @receitas = []
    i = 0
    @receber.each do |r|
      @receitas << ReceitaRecebida.new
      @receitas[i].ativo = true
      @receitas[i].data_inclusao = DateTime.now
      @receitas[i].data = DateTime.now
      @receitas[i].receita_a_receber = r
      i+=1
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
end
