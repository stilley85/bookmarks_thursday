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

  post '/delete_link' do
    Link.delete(params['id'])
    redirect '/'
  end

  get '/delete_link' do
    erb :delete_link
  end

  get '/update_link' do
    erb :update_link
  end

  post '/update_title' do
    Link.update(params[:old_link_title], params[:updated_link_title])
    redirect('/')
  end

  post '/update_url' do
    Link.update(params[:old_link_url], params[:updated_link_url])
    redirect('/')
  end



  run! if app_file == $0

end
