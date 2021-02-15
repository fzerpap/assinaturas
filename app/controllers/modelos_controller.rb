class ModelosController < ApplicationController
  before_action :set_modelo, only: [:show, :edit, :update, :destroy]

  # GET /modelos
  # GET /modelos.json
  def index
    @modelos = Modelo.all
  end

  # GET /modelos/1
  # GET /modelos/1.json
  def show
  end

  # GET /modelos/new
  def new
    @modelo = Modelo.new(nome: nil, marca_id: nil)
  end

  # GET /modelos/1/edit
  def edit
  end

  # POST /modelos
  # POST /modelos.json
  def create
    @modelo = Modelo.new(modelo_params)

    if @modelo.save
      redirect_to modelos_url, notice: I18n.t(:notice_modelo_create)
    else
      render :new 
    end

  end

  # PATCH/PUT /modelos/1
  # PATCH/PUT /modelos/1.json
  def update
    if @modelo.update_attributes(modelo_params)
      redirect_to modelos_url, notice: I18n.t(:notice_modelo_update)
    else
      render :edit 
    end
  end

  # DELETE /modelos/1
  # DELETE /modelos/1.json
  def destroy
    if @modelo.destroy
      redirect_to modelos_url, notice: I18n.t(:notice_modelo_destroy)
    else
      redirect_to modelos_url, notice: I18n.t(:notice_modelo_not_destroy)
    end
  end

  # Obtem os modelos de telefones a partir de uma marca
  def get_modelos
    marca = Marca.find(params[:marca_id])
    @modelos = Modelo.of_marca(marca.id)

    render json: @modelos

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelo
      @modelo = Modelo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Never trust parameters from the scary internet, only allow the white list through.
    def modelo_params
      params.require(:modelo).permit(:nome, :marca_id)
    end
end
