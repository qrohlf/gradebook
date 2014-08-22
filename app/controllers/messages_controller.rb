class MessagesController < ApplicationController
  before_action :require_client_api_key, only: [:create]
  before_action :set_message, only: [:show]
  protect_from_forgery :except => [:create]
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # POST /messages
  # POST /messages.json
  def create
    @room = Room.find_or_create_by(room_params)
    @message = @room.messages.new(message_params)

    if @message.save
      render json: @message, status: :created, location: [@room, @message]
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:sender, :body, :room_id, :timestamp)
    end

    def room_params
      params.require(:room).permit(:name)
    end

    def require_client_api_key
      unless params[:secret] == Rails.application.secrets.client_api_key
        render json: {error: "You must supply a valid client secret"}, status: :unauthorized
      end
    end
end
