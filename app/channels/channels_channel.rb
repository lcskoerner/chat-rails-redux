class ChannelsChannel < ApplicationCable::Channel
  def subscribed
    stream_for params[:name]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
