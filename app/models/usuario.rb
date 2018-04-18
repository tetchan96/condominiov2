class Usuario < ApplicationRecord
  belongs_to :condominio
  has_secure_password
end
