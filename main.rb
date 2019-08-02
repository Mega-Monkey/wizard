require 'sinatra'
# require 'sinatra/reloader'
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

  def back_to_login

    if current_user == false
    redirect '/'
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
  # binding.pry
  @items = Item.where(status: 'auction')
  erb :market
end

post '/market' do
  logged_in?
  item = Item.find_by(item_id: params[:item_id])
  item.status = 'auction'
  item.auction_price = params[:auction_price]
  item.save
  # binding.pry
  redirect '/market'
end

post '/return_from_auction' do
  logged_in?
  item = Item.find_by(item_id: params[:item_id])
  item.status = 'inventory'
  item.save
  # binding.pry
  redirect '/market'
end

get '/market/:item_id' do
  logged_in?
  @item = Item.find_by(item_id: params[:item_id])
  # binding.pry
  erb :market_sell_form
end

post '/auction_buy' do
  logged_in?
  item = Item.find_by(item_id: params[:item_id])
  buyer = current_user
  seller = User.find_by(id: item.owner_id)
  if buyer.gold >= item.auction_price
    # binding.pry
    buyer.gold = buyer.gold - item.auction_price
    seller.gold = seller.gold + item.auction_price
    item.owner_id = current_user.id
    item.status = 'inventory'
    item.save
    buyer.save
    seller.save
    redirect '/inventory'
  else
    redirect '/market'
  end
end

get '/inventory' do
  logged_in?
  @items = Item.where(status: "inventory").where(owner_id: current_user)
  erb :inventory
end

get '/adventure' do
  logged_in?
  erb :adventure
end

