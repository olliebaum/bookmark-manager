require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'something secret'

  get '/' do
    'Hello world'
  end
  
end
