class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  def index
    # 顧客一覧を表示
    @users = User.where(is_estate: false)
  end

  def show
    set_user
    if (@offer = @user.offer) == nil
      @offer = @user.build_offer
      @offer.save
    end
    
    if(@profile = @user.profile) == nil
      @profile = @user.build_profile
      @profile.save
    end
    
    p params
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # 今は全て一般ユーザ
    @user.is_estate = false
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
