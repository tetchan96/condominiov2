class CondominiosController < ApplicationController
  include CondominiosHelper
  before_action :set_condominio, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: []
  # GET /condominios
  # GET /condominios.json
  def index
    respond_to do |format|
      if(!current_condominio)
        @condominios = Condominio.all
      else
        format.html { redirect_to current_condominio }
        format.json { head :no_content }
      end
    end
  end

  # GET /condominios/1
  # GET /condominios/1.json
  def show
    destroy_current_apartamento
    consultarApartamentosPorCondominio(current_condominio.id)
  end

  # GET /condominios/new
  def new
    respond_to do |format|
      if(!current_condominio)
        @condominio = Condominio.new
      else
        format.html { redirect_to current_condominio }
        format.json { head :no_content }
      end
    end
  end

  # GET /condominios/1/edit
  def edit
  end

  # POST /condominios
  # POST /condominios.json
  def create
    if(!current_condominio)
      @condominio = Condominio.new(condominio_params)
  
      respond_to do |format|
        if @condominio.save
          format.html { redirect_to @condominio, notice: 'Condominio foi criado com sucesso!' }
          format.json { render :show, status: :created, location: @condominio }
          sign_out
        else
          format.html { render :new }
          format.json { render json: @condominio.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { redirect_to current_condominio }
    end
  end

  # PATCH/PUT /condominios/1
  # PATCH/PUT /condominios/1.json
  def update
    respond_to do |format|
      if @condominio.update(condominio_params)
        format.html { redirect_to @condominio, notice: 'Condomínio foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @condominio }
      else
        format.html { render :edit }
        format.json { render json: @condominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condominios/1
  # DELETE /condominios/1.json
  def destroy
    #@condominio.destroy
    respond_to do |format|
      if @condominio.update(@condominio.attributes)
        format.html { redirect_to condominios_url, notice: 'Condominio foi excluído com sucesso.' }
        format.json { head :no_content }
      else
       format.html { redirect_to condominios_url, notice: 'Condominio não foi excluído com sucesso.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condominio
      @condominio = Condominio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condominio_params
      params.require(:condominio).permit(:nome, :saldo, :fundo_reserva)
    end
end
