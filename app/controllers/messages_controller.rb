class MessagesController < ApplicationController
    before_action :require_user_logged_in
    
    def create
        if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
            @message = Message.new(message_params)
            if @message.save
                flash[:success] = 'メッセージを送信しました。'
                redirect_to "/rooms/#{@message.room_id}"
            else
                flash.now[:danger] = 'メッセージの送信に失敗しました。'
                render :new
            end
        else
            redirect_back(fallback_location: root_path)
        end
    end
    
    private
    def message_params
        params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id)
    end
end
