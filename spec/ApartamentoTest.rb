require 'rails_helper'

RSpec.describe Apartamento, type: :model do
    
    
    it "é valido" do 
        i = Apartamento.new(unidade: 100)
        i = Apartamento.new(ativo: 1)
        i = Apartamento.new(data_inclusao: 10/12/2016)
        i = Apartamento.new(data_alteracao: 11/12/2016)
        i.condominio = Condominio.first()
        
        
        #expect(i).to be_valid
end

    it "é inválido SEM UNIDADE" do 
        i = Apartamento.new(unidade: nil)
        i = Apartamento.new(ativo: 1)
        i = Apartamento.new(data_inclusao: 10/12/2016)
        i = Apartamento.new(data_alteracao: 11/12/2016)
        
        
        expect(i).to_not be_valid
end

    it "é inválido NÃO ATIVO" do 
        i = Apartamento.new(unidade: 100)
        i = Apartamento.new(ativo: nil)
        i = Apartamento.new(data_inclusao: 10/12/2016)
        i = Apartamento.new(data_alteracao: 11/12/2016)
        
        
        expect(i).to_not be_valid
end
  
    
    
end