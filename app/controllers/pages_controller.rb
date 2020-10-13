class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:timeline]

    def home
    end

    def timeline
        @company = Company.find(current_user.company_id)
        @users = User.where(company_id: @company.id)
        @posts = Post.where(user_id: @users)
    end

    def admin_users
        if current_user.admin?
            @company = Company.find(current_user.company_id)
            @users = User.where(company_id: @company.id)
        else
            format.html { redirect_to authenticated_root_path, notice: 'Você não tem permissão para acessar o gerenciamento de usuários da empresa, fale com o dono.' }
        end
    end

    def delete_user
        if current_user.admin?
            @user = User.find(params[:id])
            if @user.destroy
                respond_to do |format|
                    format.html { redirect_to administration_users_path, notice: 'Usuário deletado' }
                end
            else
                format.html { redirect_to authenticated_root_path, notice: 'Error em deletar usuário' }
            end
        else
            format.html { redirect_to authenticated_root_path, notice: 'Você não tem permissão para acessar o gerenciamento de usuários da empresa, fale com o dono.' }
        end
    end
end
