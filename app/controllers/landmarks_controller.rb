class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.find_or_create_by(name: params[:name])
    @landmark.year_completed = params[:landmark][:year_completed] if !params[:landmark][:year_completed].empty?
    redirect "/landmarks"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
end
