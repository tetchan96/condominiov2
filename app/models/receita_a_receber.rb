class ReceitaAReceber < ActiveRecord::Base
  belongs_to :apartamento
  belongs_to :descricao_tipo
  belongs_to :morador
  has_many :receita_recebida
  
  # Cria validação
  validates  :data, :natureza, :presence => true
  validates :valor, numericality: true
end
