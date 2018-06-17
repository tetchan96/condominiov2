require 'rails_helper'

RSpec.describe DescricaoTipo, type: :model do
    
    
    it "é valido" do 
        i = DescricaoTipo.new(nome: "Despesa")
        i = DescricaoTipo.new(valor_fixo: 152)
        i = DescricaoTipo.new(id: 1)
        i = DescricaoTipo.new(natureza: "Teste")
        i = DescricaoTipo.new(ativo: 0)
        
        #expect(i).to be_valid
end

    it "é invalido sem nome" do
        
        i = DescricaoTipo.new(nome: nil)
        i = DescricaoTipo.new(valor_fixo: 150)
        i = DescricaoTipo.new(id: 1)
        i = DescricaoTipo.new(natureza: "Teste")
        i = DescricaoTipo.new(ativo: 0)
      expect(i).to_not be_valid
        
    end
    
    it "é invalido sem valor" do
        
        i = DescricaoTipo.new(nome: "Despesa")
        i = DescricaoTipo.new(valor_fixo: nil)
        i = DescricaoTipo.new(id: 1)
        i = DescricaoTipo.new(natureza: "Teste")
        i = DescricaoTipo.new(ativo: 0)
      expect(i).to_not be_valid
        
    end
    
    it "é invalido sem NATUREZA" do
        
        i = DescricaoTipo.new(nome: "Despesa")
        i = DescricaoTipo.new(valor_fixo: 150)
        i = DescricaoTipo.new(id: 1)
        i = DescricaoTipo.new(natureza: nil)
        i = DescricaoTipo.new(ativo: 0)
      expect(i).to_not be_valid
        
    end
    
   
    
    
end