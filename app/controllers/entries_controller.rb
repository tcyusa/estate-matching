class EntriesController < ApplicationController
  def index
    if current_user.is_estate == true
      @entries = Entry.where(estate_user_id: current_user.id)
    else
      @entries = Entry.where(normal_user_id: current_user.id)
    end
  end

  def show
    @entry = Entry.find(params[:id])
    if (@entry.estate_user_id == current_user.id || @entry.normal_user_id == current_user.id)
      @messages = @entry.messages
      @message = Message.new
    else
      redirect_back(fallback_location: root_path)
    end
  end

end
