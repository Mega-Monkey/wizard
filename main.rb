require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative 'database_config'
require_relative 'models/user'
require_relative 'routes/sessions'
require_relative 'routes/messages'
require_relative 'models/message'
require_relative 'models/item'
require_relative 'models/auction'

enable :sessions

# make methods be availible in template
helpers do

  def logged_in? # predicated method - will return boolean
    # !!session[:user_id]
    # !!current_user - is the same
    if current_user
      true
    else
      false
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :login, :layout => :layout_not_logged_in
end

get '/sign_up' do
  erb :sign_up, :layout => :layout_not_logged_in
end

post '/sign_up_post' do
  logged_in?
  user = User.new
  user.user_name = params[:user_name]
  user.password = params[:password]
  user.avatar = params[:_avatar]
  user.save
  session[:user_id] = user.id
  redirect '/user_home'
end

get '/user_home' do
  logged_in?
  erb :user_home
end

get '/market' do
  logged_in?
  erb :market
end

get '/market/:item_id' do
  logged_in?
  @item = Item.find_by(item_id: params[:item_id])
  erb :market_sell_form
end

get '/inventory' do
  logged_in?
  @items = Item.where(owner_id: current_user.id)
  erb :inventory
end

get '/adventure' do
  logged_in?
  erb :adventure
end

