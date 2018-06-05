class Funcionario < ApplicationRecord
  belongs_to :apartamento
  
  # Cria validação
  validates  :nome, :tel, :dias_autorizados, :apartamento_id , :presence => true
end
