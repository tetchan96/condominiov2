module DespesasHelper
  def buscar_descricao_despesa
    @descricao_tipo = DescricaoTipo.all
  end
end
