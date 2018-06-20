require 'rails_helper'

RSpec.describe Usuario, type: :model do
    
    
    it "é valido" do 
        i = Usuario.new
        i.nome = "Thiago Alves"
        i.login = "admin"
        i.senha = 123456
        i.ativo = 1
        i.data_inclusao = 22/06/2016
        i.data_alteracao = 23/06/2016
        
        i = Condominio.new
        expect(i).to be_valid
end

    it "é invalido sem nome" do
        
        i = Usuario.new
        i.nome = nil
        i.login = "admin"
        i.senha = 123456
        i.ativo = 1
        i.data_inclusao = 22/06/2016
        i.data_alteracao = 23/06/2016
        
        expect(i).to_not be_valid
        
    end
    
    it "é invalido com login vazio" do
        
        i = Usuario.new
        i.nome = "Thiago Alves"
        i.login = nil
        i.senha = 123456
        i.ativo = 1
        i.data_inclusao = 22/06/2016
        i.data_alteracao = 23/06/2016
        
        expect(i).to_not be_valid
        
    end
    
    it "é invalido com senha vazio" do
        
        i = Usuario.new
        i.nome = "Thiago Alves"
        i.login = "admin"
        i.senha = nil
        i.ativo = 1
        i.data_inclusao = 22/06/2016
        i.data_alteracao = 23/06/2016
        
        expect(i).to_not be_valid
        
    end
    
    it "é invalido com inativo" do
        
        i = Usuario.new
        i.nome = "Thiago Alves"
        i.login = "admin"
        i.senha = 123456
        i.ativo = nil
        i.data_inclusao = 22/06/2016
        i.data_alteracao = 23/06/2016
        
        expect(i).to_not be_valid
        
    end
    
    it "é invalido sem data de alteração" do
        
        i = Usuario.new
        i.nome = "Thiago Alves"
        i.login = "admin"
        i.senha = 123456
        i.ativo = 1
        i.data_inclusao = nil
        i.data_alteracao = 23/06/2016
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem data de inclusão" do
        
        i = Usuario.new
        i.nome = "Thiago Alves"
        i.login = "admin"
        i.senha = 123456
        i.ativo = 1
        i.data_inclusao = 22/06/2016
        i.data_alteracao = nil
        
        expect(i).to_not be_valid
    end
    
end