class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new(nome:nil, cpf: nil, email: nil)
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      redirect_to clientes_url, notice: I18n.t(:notice_cliente_create)
    else
      render :new 
    end

  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    if @cliente.update_attributes(cliente_params)
      redirect_to clientes_url, notice: I18n.t(:notice_cliente_update)
    else
      render :edit 
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    if @cliente.destroy
      redirect_to clientes_url, notice: I18n.t(:notice_cliente_destroy)
    else
      redirect_to clientes_url, notice: I18n.t(:notice_cliente_not_destroy)
    end
  end

  # GET /search_cliente
  def search_cliente
  end

  # POST /clientes
  def verificar
    @cliente = Cliente.find(params[:cpf_cliente]) rescue nil
    if @cliente.nil?
      @cpf_cliente = params[:cpf_cliente]
      redirect_to  new_assinatura_path, notice: "CPF do cliente nao existe, deve cadastrar-lho"
    else
      @assinaturas = Assinatura.todas
      #redirect_to cliente_assinatura_path, notice: "O cliente já existe"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id]) rescue nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nome, :cpf, :email)
    end
end
