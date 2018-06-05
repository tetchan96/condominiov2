class Morador < ActiveRecord::Base
  belongs_to :apartamento
  has_many :receita_a_receber
  
  # Cria validação
  validates  :nome, :cpf, :email, :tel_residencial, :apartamento_id , :presence => true
end
