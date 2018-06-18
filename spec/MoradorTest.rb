require 'rails_helper'

RSpec.describe Morador, type: :model do
    
    
    it "é valido" do 
        i = Morador.new(nome: "Thiago")
        i = Morador.new(cpf: 07414747117)
        i = Morador.new(email: "thiagoalves@testesistemas.com.br")
        i = Morador.new(tel_residencial: 999999999)
        i = Morador.new(apartamento_id: 1)
        
        #expect(i).to be_valid
    end
    
    it "é invalido sem Nome" do 
        i = Morador.new(nome: nil)
        i = Morador.new(cpf: 07414747117)
        i = Morador.new(email: "thiagoalves@testesistemas.com.br")
        i = Morador.new(tel_residencial: 999999999)
        i = Morador.new(apartamento_id: 1)
        
        
        expect(i).to_not be_valid
    end
    
        it "é invalido sem cpf" do 
        i = Morador.new(nome: "Thiago Alves")
        i = Morador.new(cpf: nil)
        i = Morador.new(email: "thiagoalves@testesistemas.com.br")
        i = Morador.new(tel_residencial: 999999999)
        i = Morador.new(apartamento_id: 1)
        
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem email" do 
        i = Morador.new(nome: "Thiago Alves")
        i = Morador.new(cpf: 12345678998)
        i = Morador.new(email: nil)
        i = Morador.new(tel_residencial: 999999999)
        i = Morador.new(apartamento_id: 1)
        
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem telefone" do 
        i = Morador.new(nome: "Thiago Alves")
        i = Morador.new(cpf: 124567879898)
        i = Morador.new(email: "thiagoalves@testesistemas.com.br")
        i = Morador.new(tel_residencial: nil)
        i = Morador.new(apartamento_id: 1)
        
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem estar vinculado a um apartamento" do 
        i = Morador.new(nome: "Thiago Alves")
        i = Morador.new(cpf: 124567879898)
        i = Morador.new(email: "thiagoalves@testesistemas.com.br")
        i = Morador.new(tel_residencial: 3125478)
        i = Morador.new(apartamento_id: nil)
        
        
        expect(i).to_not be_valid
    end
    
end