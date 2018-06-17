require 'rails_helper'

RSpec.describe Funcionario, type: :model do
    
    
    it "é valido" do 
        i = Funcionario.new(nome: "Thiago")
        i = Funcionario.new(tel: 34281997)
        i = Funcionario.new(dias_autorizados: "Segunda-Terca-Quarta")
        i = Funcionario.new(ativo: 1)
        i = Funcionario.new(data_inclusao: 10/12/2016)
        i = Funcionario.new(data_alteracao: 11/12/2016)
        
        #expect(i).to be_valid
end
    it "é invalido sem nome" do 
        i = Funcionario.new(nome: nil)
        i = Funcionario.new(tel: 34281997)
        i = Funcionario.new(dias_autorizados: "Segunda-Terca-Quarta")
        i = Funcionario.new(ativo: 1)
        i = Funcionario.new(data_inclusao: 10/12/2016)
        i = Funcionario.new(data_alteracao: 11/12/2016)
        
        expect(i).to_not be_valid
end
    
    it "é invalido sem Telefone" do 
        i = Funcionario.new(nome: "Thiago Alves")
        i = Funcionario.new(tel: nil)
        i = Funcionario.new(dias_autorizados: "Segunda-Terca-Quarta")
        i = Funcionario.new(ativo: 1)
        i = Funcionario.new(data_inclusao: 10/12/2016)
        i = Funcionario.new(data_alteracao: 11/12/2016)
        
        expect(i).to_not be_valid
end

    it "é invalido sem Telefone" do 
        i = Funcionario.new(nome: "Thiago")
        i = Funcionario.new(tel: nil)
        i = Funcionario.new(dias_autorizados: "Segunda-Terca-Quarta")
        i = Funcionario.new(ativo: 1)
        i = Funcionario.new(data_inclusao: 10/12/2016)
        i = Funcionario.new(data_alteracao: 11/12/2016)
        
        expect(i).to_not be_valid
end
    
    it "é invalido sem Dias Autorizados" do 
        i = Funcionario.new(nome: "Thiago")
        i = Funcionario.new(tel: 34281997)
        i = Funcionario.new(dias_autorizados: nil)
        i = Funcionario.new(ativo: 1)
        i = Funcionario.new(data_inclusao: 10/12/2016)
        i = Funcionario.new(data_alteracao: 11/12/2016)
        
        expect(i).to_not be_valid
end

    it "é invalido para Funcionários Inativos" do 
        i = Funcionario.new(nome: "Thiago")
        i = Funcionario.new(tel: 34281997)
        i = Funcionario.new(dias_autorizados: "Segunda Terça Quarta Quinta")
        i = Funcionario.new(ativo: nil)
        i = Funcionario.new(data_inclusao: 10/12/2016)
        i = Funcionario.new(data_alteracao: 11/12/2016)
        
        expect(i).to_not be_valid
end
    
    
  
    
    
end