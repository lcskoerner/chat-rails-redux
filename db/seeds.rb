Message.destroy_all
User.destroy_all
Channel.destroy_all

channel_names = ['general', 'paris', 'react']

channel_names.each do |channel|
  c = Channel.new(name: channel)
  c.save!
end

channels = Channel.all

puts 'Channels created!'

dio = User.new(email: 'dio@brando.com', password:'iamevil')
dio.save!

jojo = User.new(email: 'jojo@joestar.com', password:'iamnotevil')
jojo.save!

users = [dio, jojo]

puts 'Users created!'

10.times do
  fake_message = Faker::Quotes::Shakespeare.hamlet_quote
  message = Message.new(
    user: users.sample,
    channel: channels.sample,
    content: fake_message
    )
  message.save!
end

puts 'Messages created!'
