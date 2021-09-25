class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_user, except: :index
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_index_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday,
                                 :prefecture_id, :phone_namber, :os_type_id, :use_app1, :use_app2, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless current_user.id == @user.id
  end
end
