class FornecedorController < ApplicationController
  before_action :authorize
  before_action :set_fornecedor, only: %i[ show update destroy ]

  # GET /fornecedor
  def index
    @fornecedor = Fornecedor.all

    render json: @fornecedor
  end

  # GET /fornecedor/1
  def show
    render json: @fornecedor
  end

  # POST /fornecedor
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    if @fornecedor.save
      render json: @fornecedor, status: :created, location:api_v1_cliente_url(@fornecedor)
    else
      render json: @fornecedor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fornecedor/1
  def update
    if @fornecedor.update(fornecedor_params)
      render json: @fornecedor
    else
      render json: @fornecedor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fornecedor/1
  def destroy
    @fornecedor.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fornecedor_params
      params.require(:fornecedor).permit(:nome, :cpf, :cep, :cnpj, :endereco, :cidade, :bairro, :uf, :telefone, :telefone_fixo, :email)
    end
end
