module ApplicationHelper
  
  def buscar_condominios
    @condominio = Condominio.all
  end
  
  def buscar_descricao_despesa
    @descricao_tipo = DescricaoTipo.all
  end
  
  def buscar_apartamentos
    @apartamento = Apartamento.all
  end
  
  def buscar_morador
    @morador = Morador.all
  end
  
  def consultarApartamentosPorCondominio idCondominio
    @apartamentos = Apartamento.where(condominio_id: idCondominio, ativo: true)
  end
  
  def consultarVeiculosPorApartamento id
    @veiculos = Veiculo.where(apartamento_id: id, ativo: true)
  end
  
  def consultarMoradoresPorApartamento id
    @moradors = Morador.where(apartamento_id: id, ativo: true)
  end
  
  def consultarFuncionariosPorApartamento id
    @funcionarios = Funcionario.where(apartamento_id: id, ativo: true)
  end
  
  
end
