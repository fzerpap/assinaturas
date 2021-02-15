

class MarcasController < ApplicationController
  before_action :set_marca, only: [:show, :edit, :update, :destroy]

  # GET /marcas
  # GET /marcas.json
  def index
    @marcas = Marca.all
    
    #@marcas = Pitzi.deserializer_colection(marcas)

  end

  # GET /marcas/1
  # GET /marcas/1.json
  def show
  end

  # GET /marcas/new
  def new
    @marca = Marca.new(nome: nil)
  end

  # GET /marcas/1/edit
  def edit

  end

  # POST /marcas
  # POST /marcas.json
  def create
    @marca = Marca.new(marca_params)

    if @marca.save
      redirect_to marcas_url, notice: I18n.t(:notice_marca_create) 
    else
      render :new 
    end
  end

  # PATCH/PUT /marcas/1
  # PATCH/PUT /marcas/1.json
  def update
    if @marca.update_attributes(marca_params)
      redirect_to marcas_url, notice: I18n.t(:notice_marca_update) 
    else
      render :edit 
    end
  end

  # DELETE /marcas/1
  # DELETE /marcas/1.json
  def destroy
    if @marca.destroy
      redirect_to marcas_url, notice: I18n.t(:notice_marca_destroy)
    else
      redirect_to marcas_url, notice: I18n.t(:notice_marca_not_destroy)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marca
      @marca = Marca.find(params[:id])
      #marca_json = Marca.find(params[:id])
      #marca_attrs = Pitzi.deserializer_object(marca_json)
      #@marca = Marca.new(marca_attrs.merge(persisted: true))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marca_params
      params.require(:marca).permit(:nome)
    end
end
