require 'rails_helper'

RSpec.describe Funcionario, type: :model do
    
    
    it "é valido" do 
        i = Funcionario.new
        i.nome = "Thiago"
        i.tel = 34281997
        i.dias_autorizados = "Segunda-Terca-Quarta"
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        i = Apartamento.new
        i = Condominio.new
        
        expect(i).to be_valid
end
    it "é invalido sem nome" do 
         i = Funcionario.new
        i.nome = nil
        i.tel = 34281997
        i.dias_autorizados = "Segunda-Terca-Quarta"
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        
        expect(i).to_not be_valid
end
    
    it "é invalido sem Telefone" do 
         i = Funcionario.new
        i.nome = "Thiago"
        i.tel = nil
        i.dias_autorizados = "Segunda-Terca-Quarta"
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        
        expect(i).to_not be_valid
end

    it "é invalido sem Telefone" do 
        i = Funcionario.new
        i.nome = "Thiago"
        i.tel = nil
        i.dias_autorizados = "Segunda-Terca-Quarta"
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        
        expect(i).to_not be_valid
end
    
    it "é invalido sem Dias Autorizados" do 
         i = Funcionario.new
        i.nome = "Thiago"
        i.tel = 34281997
        i.dias_autorizados = nil
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        
        expect(i).to_not be_valid
end

    it "é invalido para Funcionários Inativos" do 
         i = Funcionario.new
        i.nome = "Thiago"
        i.tel = 34281997
        i.dias_autorizados = "Segunda-Terca-Quarta"
        i.ativo = nil
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        
        expect(i).to_not be_valid
end
    
    
  
    
    
end