require 'sinatra/base'
require_relative './lib/link'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    @links = [
        "www.google.co.uk"
        "www.yahoo.com"
        "www.facebook.com"
        "www.twitter.com"
             ]

    erb :index
  end

  run! if app_file == $0

end