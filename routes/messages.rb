get '/messages' do
  logged_in?
  @message = Message.where(recived: current_user.user_name)
  erb :messages
end

post '/messages' do
    redirect '/login' unless session[:user_id]
    # insert messages into db
    # params[:body]
    message = Message.new
    message.body = params[:body]
    message.recived = params[:recived]
    message.sent = current_user.user_name
    message.save
    redirect "/messages"
  end

 