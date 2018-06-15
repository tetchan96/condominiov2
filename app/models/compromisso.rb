class Compromisso < ActiveRecord::Base
  # Cria validação
  validates  :titulo , :presence => true
  validates  :texto , :presence => true
  validates  :date , :presence => true
end