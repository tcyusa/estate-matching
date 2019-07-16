class OffersController < ApplicationController
  before_action :require_user_logged_in
  before_action :offer_params, only: [:update]
  
  def new
  end

  def create
  end

  def edit
    if (@offer = current_user.offer) == nil
      @offer = @user.build_offer
      @offer.save
    end
    
    p @offer
  end

  def update
    @offer = current_user.offer

    if @offer.update(offer_params)
      flash[:success] = 'オファー内容を編集しました。'
      redirect_to user_path(current_user.id)
    else
      flash.now[:danger] = 'オファー内容の編集に失敗しました。'
      render :edit
    end
  end

  def destroy
    @offer = current_user.offer
    
    @offer.destroy
    flash[:success] = 'オファーを終了しました。'
    redirect_to user_path(current_user.id)
  end
  
  private
  
  def offer_params
    p params
    params.require(:offer).permit(:min_price, :max_price, :years, :walking_time, :min_size, :is_family, :is_offered, city_ids: [], choice_ids: [])
  end
  
end
