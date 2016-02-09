require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end