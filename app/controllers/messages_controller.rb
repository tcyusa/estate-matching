class MessagesController < ApplicationController
    before_action :require_user_logged_in
    
    def create
        @entry = Entry.find(params[:message][:entry_id])
#        p @entry
        if (@entry.normal_user.id == current_user.id || @entry.estate_user.id == current_user.id)
#        if Entry.where(:user_id => current_user.id, :entry_id => params[:message][:entry_id]).present?
            @message = Message.new(message_params)
            if @message.save
                flash[:success] = 'メッセージを送信しました。'
                redirect_to "/entries/#{@message.entry_id}"
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
        params.require(:message).permit(:user_id, :content, :entry_id).merge(:user_id => current_user.id)
    end
end
