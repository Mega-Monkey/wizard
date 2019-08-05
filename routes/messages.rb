get '/messages' do
  redirect '/' unless logged_in?
  @message = Message.where(receiver_id: current_user.id).order(message_id: :desc)
  erb :messages
end

post '/messages' do
    redirect '/' unless logged_in?
    # insert messages into db
    # params[:body]
    message = Message.new
    message.body = params[:body]
    message.receiver_id = User.find_by(user_name: params[:user_name]).id
    message.sender_id = current_user.id
    message.subject = params[:subject]
    message.save
    redirect "/messages"
end

get '/messages/:id' do
  redirect '/' unless logged_in?
  @message = Message.where(message_id: params[:id])
  erb :message_view
end
 