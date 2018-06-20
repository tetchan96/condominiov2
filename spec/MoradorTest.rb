require 'rails_helper'

RSpec.describe Morador, type: :model do
    
    
    it "é valido" do 
        i = Morador.new
        i.nome = "Thiago"
        i.cpf = 07414747117
        i.email = "thiagoalves@testesistemas.com.br"
        i.tel_residencial = 999999999
        i.apartamento_id = 1
        i = Apartamento.new
        i = Condominio.new
        
        
        expect(i).to be_valid
    end
    
    it "é invalido sem Nome" do 
        i = Morador.new
        i.nome = nil
        i.cpf = 07414747117
        i.email = "thiagoalves@testesistemas.com.br"
        i.tel_residencial = 999999999
        i.apartamento_id = 1
        
        
        expect(i).to_not be_valid
    end
    
        it "é invalido sem cpf" do 
       i = Morador.new
        i.nome = "Thiago"
        i.cpf = nil
        i.email = "thiagoalves@testesistemas.com.br"
        i.tel_residencial = 999999999
        i.apartamento_id = 1
        
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem email" do 
        i = Morador.new
        i.nome = "Thiago"
        i.cpf = 07414747117
        i.email = nil
        i.tel_residencial = 999999999
        i.apartamento_id = 1
        
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem telefone" do 
        i = Morador.new
        i.nome = "Thiago"
        i.cpf = 07414747117
        i.email = "thiagoalves@testesistemas.com.br"
        i.tel_residencial = nil
        i.apartamento_id = 1
        
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem estar vinculado a um apartamento" do 
        i = Morador.new
        i.nome = "Thiago"
        i.cpf = 07414747117
        i.email = "thiagoalves@testesistemas.com.br"
        i.tel_residencial = 999999999
        i.apartamento_id = nil
        
        
        expect(i).to_not be_valid
    end
    
end