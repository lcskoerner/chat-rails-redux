class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = Message.where(channel: @channel)
    render json: messages
  end

  def create
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
