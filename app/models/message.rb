class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true

  def as_json(options = {})

    nickname = user.nickname.nil? ? user.email.match(/[^@]+/)[0] : user.nickname
    {
      id: id,
      author: nickname,
      content: content,
      created_at: created_at,
      channel: channel.name
    }
  end
end
