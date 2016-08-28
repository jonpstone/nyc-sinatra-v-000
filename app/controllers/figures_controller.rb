class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    if !params[:figure][:name].empty?
      @figure = Figure.find_or_create_by(name: params[:figure][:name])
      params[:figure][:landmark_ids].each{|id| @figure.landmarks << Landmark.find(id)} if params[:figure].has_key?("landmark_ids") && !params[:figure][:landmark_ids].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !params[:landmark][:name].empty?
      params[:figure][:title_ids].each{|id| @figure.titles << Title.find(id)} if params[:figure].has_key?("title_ids") && !params[:figure][:title_ids].empty?
      @figure.titles << Title.find_or_create_by(params[:title]) if !params[:title][:name].empty?
      @figure.save
      redirect "/figures/#{@figure.id}"
    else
      redirect "/figures/new"
    end
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    params[:figure][:landmark_ids].each{|id| @figure.landmarks << Landmark.find(id)} if params[:figure].has_key?("landmark_ids") && !params[:figure][:landmark_ids].empty?
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !params[:landmark][:name].empty?
    params[:figure][:title_ids].each{|id| @figure.titles << Title.find(id)} if params[:figure].has_key?("title_ids") && !params[:figure][:title_ids].empty?
    @figure.titles << Title.find_or_create_by(params[:title]) if !params[:title][:name].empty?
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
