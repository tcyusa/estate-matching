class RoomsController < ApplicationController
    before_action :require_user_logged_in

    def index
        @entries = Entry.where(user_id: current_user.id)
    end
    
    def create
    end

    def show
        @room = Room.find(params[:id])
        if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
            @messages = @room.messages
            @message = Message.new
            @entries = @room.entries
        else
            redirect_back(fallback_location: root_path)
        end
    end
end
