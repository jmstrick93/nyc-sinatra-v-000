class LandmarksController < ApplicationController

  #Create
  get '/landmarks/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figures = Figure.all
    erb :'landmarks/new'
  end

  post "/landmarks" do
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
    erb :'landmarks/index'
  end

  #Read

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])

    erb :'landmarks/show'
  end

  #Update

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])

    @landmarks = Landmark.all
    @figures = Figure.all

    erb :'landmarks/edit'
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

end
