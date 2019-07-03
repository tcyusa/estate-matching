class OffersController < ApplicationController
  before_action :require_user_logged_in

  def create
  end

  def edit
    @offer = current_user.offer
  end

  def update
    @offer = current_user.offer
    
    if @offer.update(offer_params)
      flash[:success] = 'オファー内容を編集しました。'
      redirect_to user_path
    else
      flash.now[:danger] = 'オファー内容の編集に失敗しました。'
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def offer_params
    p params
    params.require(:offer).permit(:min_price, :max_price)
  end
end
