class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :correct_user, only: [:edit, :update]
  
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      flash.now[:notice] = '投稿に失敗しました'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :prefecture_id, :phone_namber, :os_type_id, :use_app1, :use_app2, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end

end
