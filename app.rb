require 'sinatra/base'
require './lib/bookmark_manager'
require './lib/bookmark'

class BookmarkApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'something secret'

  get '/' do
    session[:bookmarks] = BookmarkManager.new
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    erb(:bookmarks)
  end

  get '/add' do
    erb(:add)
  end

  post '/add' do
    session[:bookmarks].add(params[:title], params[:url])
    redirect '/bookmarks'
  end

end
