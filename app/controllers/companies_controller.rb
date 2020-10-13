class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]

  # GET /companies/new
  def new
    @company = Company.new 
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @user = User.new(name: company_params[:name], username: company_params[:username], email: company_params[:email], password: company_params[:password], password_confirmation: company_params[:password], admin: true)
    @company = Company.new(name: company_params[:name_company])
    respond_to do |format|
      if User.where(:username => @user.username).present? == false
        @user.company_id = @company.id
        if @company.save && register_boss?
          format.html { redirect_to new_user_session_path, notice: 'Empresa e usuário dono criados com sucesso, acesse sua conta com as credenciais de "Nome de usuário" e "Senha".'}
        else
          format.html { redirect_to authenticated_root_path, notice: 'Erro em salvar empresa, verifique os campos.'}
        end
      else
        format.html { redirect_to authenticated_root_path, notice: 'Error em criar usuário dono, sua empresa não pode ser criada sem um dono.' }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if current_user.admin && @company.user_id == current_user.id && @company.update(name: company_params[:name_company])
        format.html { redirect_to @company, notice: 'Empresa atualizada com sucesso.' }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :forbidden }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    if current_user.admin && @company.user_id == current_user.id
      @company.destroy
      respond_to do |format|
        format.html { redirect_to companies_url, notice: 'Empresa removida com sucesso.' }
        format.json { head :no_content }
      end
    else
      format.html { render :new }
      format.json { render json: @company.errors, status: :forbidden
 }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def register_boss?
      @user.company_id = @company.id
      if @user.save
        return true
      else
        return false
      end
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :name_company, :username, :email, :password)
    end
end
