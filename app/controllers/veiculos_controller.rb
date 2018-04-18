class VeiculosController < ApplicationController
  include VeiculosHelper
  before_action :set_veiculo, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: []
  before_action :buscar_apartamentos, only: [:new, :edit]
  # GET /veiculos
  # GET /veiculos.json
  def index
    @veiculos = Veiculo.all
  end

  # GET /veiculos/1
  # GET /veiculos/1.json
  def show
  end

  # GET /veiculos/new
  def new
    @veiculo = Veiculo.new
    @veiculo.apartamento = current_apartamento
  end

  # GET /veiculos/1/edit
  def edit
  end

  # POST /veiculos
  # POST /veiculos.json
  def create
    @veiculo = Veiculo.new(veiculo_params)
    @veiculo.ativo = true
    @veiculo.data_inclusao = DateTime.now
    respond_to do |format|
      if @veiculo.save
        format.html { redirect_to @veiculo, notice: 'Veiculo was successfully created.' }
        format.json { render :show, status: :created, location: @veiculo }
      else
        format.html { render :new }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veiculos/1
  # PATCH/PUT /veiculos/1.json
  def update
    @veiculo.data_alteracao = DateTime.now
    respond_to do |format|
      if @veiculo.update(veiculo_params)
        format.html { redirect_to @veiculo, notice: 'Veiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @veiculo }
      else
        format.html { render :edit }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veiculos/1
  # DELETE /veiculos/1.json
  def destroy
#    @veiculo.destroy
    @veiculo.ativo = !@veiculo.ativo
    @veiculo.data_alteracao = DateTime.now
    respond_to do |format|
      if @veiculo.update(@veiculo.attributes)
        format.html { redirect_to @veiculo.apartamento, notice: 'Veiculo was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @veiculo.apartamento, notice: 'Veiculo wasn\'t successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def veiculo_params
      params.require(:veiculo).permit(:marca, :modelo, :cor, :placa, :apartamento_id)
    end
end
