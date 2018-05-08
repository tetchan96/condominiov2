class ApartamentosController < ApplicationController
  include ApartamentosHelper
  before_action :set_apartamento, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: []
  before_action :buscar_condominios, only: [:edit, :update, :new, :create]
  # GET /apartamentos
  # GET /apartamentos.json
  def index
    @apartamentos = Apartamento.all
  end

  # GET /apartamentos/1
  # GET /apartamentos/1.json
  def show
    set_current_apartamento(@apartamento)
    consultarVeiculosPorApartamento(@apartamento.id)
    consultarMoradoresPorApartamento(@apartamento.id)
    consultarFuncionariosPorApartamento(@apartamento.id)
  end

  # GET /apartamentos/new
  def new
    @apartamento = Apartamento.new
    @apartamento.condominio = current_condominio
  end

  # GET /apartamentos/1/edit
  def edit
  end

  # POST /apartamentos
  # POST /apartamentos.json
  def create
    @apartamento = Apartamento.new(apartamento_params)
    @apartamento.ativo = true
    @apartamento.data_inclusao = DateTime.now

    respond_to do |format|
      if @apartamento.save
        format.html { redirect_to @apartamento, notice: 'Apartamento foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @apartamento }
      else
        format.html { render :new }
        format.json { render json: @apartamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartamentos/1
  # PATCH/PUT /apartamentos/1.json
  def update
    @apartamento.data_alteracao = DateTime.now
    respond_to do |format|
      if @apartamento.update(apartamento_params)
        format.html { redirect_to @apartamento, notice: 'Apartamento foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @apartamento }
      else
        format.html { render :edit }
        format.json { render json: @apartamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartamentos/1
  # DELETE /apartamentos/1.json
  def destroy
    #@apartamento.destroy
    @apartamento.ativo = !@apartamento.ativo
    @apartamento.data_alteracao = DateTime.now
    respond_to do |format|
      if @apartamento.update(@apartamento.attributes)
        format.html { redirect_to @apartamento.condominio, notice: 'Apartamento foi excluído com sucesso.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @apartamento.condominio, notice: 'Apartamento não foi excluído com sucesso.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartamento
      @apartamento = Apartamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartamento_params
      params.require(:apartamento).permit(:unidade, :condominio_id)
    end
end
