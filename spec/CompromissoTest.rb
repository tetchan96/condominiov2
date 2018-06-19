require 'rails_helper'

RSpec.describe Compromisso, type: :model do
    
    
    it "é valido" do 
        i = Compromisso.new(titulo: "100")
        i = Compromisso.new(texto: 1)
        i = Compromisso.new(date: 10/12/2016)
        
        expect(Condominio.new).to be_valid
    end
    
    it "é invalido sem título" do 
        i = Compromisso.new(titulo: nil)
        i = Compromisso.new(texto: "1")
        i = Compromisso.new(date: 10/12/2016 )
        
            expect(i).to_not be_valid
    end
    
    it "é invalido sem texto" do 
        i = Compromisso.new(titulo: "100")
        i = Compromisso.new(texto: nil)
        i = Compromisso.new(date: 10/12/2016)
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem data de realização" do 
        i = Compromisso.new(titulo: "100")
        i = Compromisso.new(texto: 1)
        i = Compromisso.new(date: nil)
        
        expect(i).to_not be_valid
    end

end

