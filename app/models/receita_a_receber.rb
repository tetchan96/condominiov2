class ReceitaAReceber < ApplicationRecord
  belongs_to :apartamento
  belongs_to :descricao_tipo
  belongs_to :morador
  has_many :receita_recebida
end
