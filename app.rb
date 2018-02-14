require 'sinatra/base'
require_relative './lib/link'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add_new_link' do
    erb :add_new_links
  end

  post '/new_link_added' do
    Link.add_link(params[:new_link])
    redirect '/'
  end

  run! if app_file == $0

end