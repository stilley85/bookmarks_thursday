require 'sinatra/base'
require './lib/databaseconnection_setup'
require_relative './lib/link'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add_new_link' do
    erb :add_new_links
  end

  post '/new_link_added' do
    redirect '/' if Link.add_link(params[:new_link], params[:new_link_title])
    flash.now[:error] = "You must submit a valid URL."
  end

  run! if app_file == $0

end
