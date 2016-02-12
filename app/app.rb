ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    params[:name].split(" ").each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/filter_tags'
  end

  get '/signup' do
    erb :'links/signup'
  end

  post '/signup' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect '/signup/confirmation'
  end

  get '/signup/confirmation' do
    erb :'links/confirmation'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
