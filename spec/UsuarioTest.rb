require 'rails_helper'

RSpec.describe Usuario, type: :model do
    
    
    it "é valido" do 
        i = Usuario.new(nome: "Thiago Alves")
        i = Usuario.new(login: "admin")
        i = Usuario.new(senha: 123456)
        i = Usuario.new(ativo: 1)
        i = Usuario.new(data_inclusao: 22/06/2016)
        i = Usuario.new(data_alteracao: 23/06/2016)
        
        #expect(i).to be_valid
end

    it "é invalido sem nome" do
        
        i = Usuario.new(nome: nil)
        i = Usuario.new(login: "admin")
        i = Usuario.new(senha: "123456")
        i = Usuario.new(ativo: 1)
        i = Usuario.new(data_inclusao: 22/06/2016)
        i = Usuario.new(data_alteracao: 23/06/2016)
        
        expect(i).to_not be_valid
        
    end
    
    it "é invalido com login vazio" do
        
        i = Usuario.new(nome: "Thiago Alves")
        i = Usuario.new(login: nil)
        i = Usuario.new(senha: "123456")
        i = Usuario.new(ativo: 1)
        i = Usuario.new(data_inclusao: 22/06/2016)
        i = Usuario.new(data_alteracao: 23/06/2016)
        
        expect(i).to_not be_valid
        
    end
    
    it "é invalido com senha vazio" do
        
        i = Usuario.new(nome: "Thiago Alves")
        i = Usuario.new(login: "admin")
        i = Usuario.new(senha: nil)
        i = Usuario.new(ativo: 1)
        i = Usuario.new(data_inclusao: 22/06/2016)
        i = Usuario.new(data_alteracao: 23/06/2016)
        
        expect(i).to_not be_valid
        
    end
    
    it "é invalido com inativo" do
        
        i = Usuario.new(nome: "Thiago Alves")
        i = Usuario.new(login: "Thiago_Alves")
        i = Usuario.new(senha: "123456")
        i = Usuario.new(ativo: nil)
        i = Usuario.new(data_inclusao: 22/06/2016)
        i = Usuario.new(data_alteracao: 23/06/2016)
        
        expect(i).to_not be_valid
        
    end
    
    it "é invalido sem data de alteração" do
        
        i = Usuario.new(nome: "Thiago Alves")
        i = Usuario.new(login: "Thiago_Alves")
        i = Usuario.new(senha: "123456")
        i = Usuario.new(ativo: 0)
        i = Usuario.new(data_inclusao: nil)
        i = Usuario.new(data_alteracao: 23/06/2016)
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem data de inclusão" do
        
        i = Usuario.new(nome: "Thiago Alves")
        i = Usuario.new(login: "Thiago_Alves")
        i = Usuario.new(senha: "123456")
        i = Usuario.new(ativo: 0)
        i = Usuario.new(data_inclusao: 23/06/2018)
        i = Usuario.new(data_alteracao: nil)
        
        expect(i).to_not be_valid
    end
    
end