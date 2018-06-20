require 'rails_helper'

RSpec.describe DescricaoTipo, type: :model do
    
    
    it "é valido" do 
        i = DescricaoTipo.new
        i.nome = "Despesa"
        i.valor_fixo = 152
        i.id = 1
        i.natureza = "Teste"
        i.ativo = 0
        
        expect(i).to be_valid
end

    it "é invalido sem nome" do
        
        i = DescricaoTipo.new
        i.nome = nil
        i.valor_fixo = 152
        i.id = 1
        i.natureza = "Teste"
        i.ativo = 0
        
        
        expect(DescricaoTipo.new).to_not be_valid
        
    end
    
    it "é invalido sem valor" do
        
        i = DescricaoTipo.new
        i.nome = "Despesa"
        i.valor_fixo = nil
        i.id = 1
        i.natureza = "Teste"
        i.ativo = 0
       expect(DescricaoTipo.new).to_not be_valid
      
        
    end
    
    it "é invalido sem NATUREZA" do
        
        i = DescricaoTipo.new
        i.nome = "Despesa"
        i.valor_fixo = 152
        i.id = 1
        i.natureza = nil
        i.ativo = 0
        
        
       expect(DescricaoTipo.new).to_not be_valid
        
    end
    
   
    
    
end