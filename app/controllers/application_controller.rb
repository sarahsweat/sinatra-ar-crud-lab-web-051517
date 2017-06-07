require_relative '../../config/environment'

require "pry"
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    redirects to '/posts'
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    Post.find_by_id(params[:id]).update(name: params[:name],content: params[:content])
    erb :show
  end


    delete '/posts/:id/delete' do
      @post = Post.find_by_id(params[:id]).delete

      erb :delete
    end


end
