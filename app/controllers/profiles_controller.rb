class ProfilesController < ApplicationController
  before_action :require_user_logged_in
  before_action :profile_params, only: [:update]
  
  def edit
    if (@profile = current_user.profile) == nil
      @profile = @user.build_profile
      @profile.save
    end
    
    p @profile
  end

  def update
    @profile = current_user.profile
    
    if @profile.update(profile_params)
      flash[:success] = 'プロフィール内容を編集しました。'
      redirect_to user_path(current_user.id)
    else
      flash.now[:danger] = 'プロフィール内容の編集に失敗しました。'
      render :edit
    end
  end
  
  private
  def profile_params
    p params
    params.require(:profile).permit(:pr, :address, :representative_name, :tel, city_ids: [])
  end
end
