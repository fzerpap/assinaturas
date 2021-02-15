class AssinaturasController < ApplicationController
  before_action :set_assinatura, only: [:show, :edit, :update, :destroy]

  # GET /assinaturas
  # GET /assinaturas.json
  def index
    if params[:cliente_id].nil?
      @assinaturas = Assinatura.todas
    else
      @assinaturas = Assinatura.cliente(params[:cliente_id])
    end
  end

  # GET /assinaturas/1
  # GET /assinaturas/1.json
  def show
  end

  # GET /assinaturas/new
  def new
    @assinatura = Assinatura.new(imei: nil, preco_anual: nil, num_parcelas: nil, modelo_id: nil,
                                cliente_id: nil, data_emisao: Date.today, data_vencimento: Date.today+365)
  end

  # GET /assinaturas/1/edit
  def edit
  end

  # POST /assinaturas
  # POST /assinaturas.json
  def create
    cliente_existe = true
    @cliente = Cliente.find(params[:cpf]) rescue nil
    if @cliente.nil?
      @cliente = Cliente.new(nome: params[:nome], cpf: params[:cpf], email: params[:email])
      if !@cliente.save
        cliente_existe = false
      end
    end 
    @assinatura = @assinatura = Assinatura.new(assinatura_params.merge(cliente_id: @cliente.id)) 
    if cliente_existe && @assinatura.save
      redirect_to assinaturas_url, notice: I18n.t(:notice_assinatura_create)
    else
      render :new 
    end
  end

  # PATCH/PUT /assinaturas/1
  # PATCH/PUT /assinaturas/1.json
  def update
    if @assinatura.update(assinatura_params)
      redirect_to assinaturas_url, notice: I18n.t(:notice_assinatura_update)
    else
      render :edit
    end
  end

  # DELETE /assinaturas/1
  # DELETE /assinaturas/1.json
  def destroy
    if @assinatura.destroy
      redirect_to assinaturas_url, notice: I18n.t(:notice_assinatura_destroy) 
    else
      redirect_to assinaturas_url, notice: I18n.t(:notice_assinatura_not_destroy) 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assinatura
      @assinatura = Assinatura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assinatura_params
      params.require(:assinatura).permit(:imei, :preco_anual, :num_parcelas, :status, :data_emisao, :data_vencimento, :modelo_id, :cliente_id)
    end
end
