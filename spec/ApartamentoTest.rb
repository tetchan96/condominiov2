require 'rails_helper'

RSpec.describe Apartamento, type: :model do
    
    
    it "é valido" do 
        i = Apartamento.new
        i.unidade = 100
        i.ativo = 1
        i.data_inclusao = "10/12/2016"
        i.data_alteracao = "11/12/2016"
       i.condominio = Condominio.new
        
        expect(i).to be_valid
end

    it "é inválido SEM UNIDADE" do 
       i = Apartamento.new
        i.unidade = nil
        i.ativo = 1
        i.data_inclusao = "10/12/2016"
        i.data_alteracao = "11/12/2016"
        expect(i).to_not be_valid
end

    it "é inválido NÃO ATIVO" do 
       i = Apartamento.new
        i.unidade = 100
        i.ativo = nil
        i.data_inclusao = "10/12/2016"
        i.data_alteracao = "11/12/2016"
        expect(i).to_not be_valid
end
  
    
    
end