class FiguresController < ApplicationController

  #Create
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])


    if !params[:title][:name].empty?
      if Title.all.detect { |title| title.name == params[:title][:name] }
        #  if the title already exists, find and add it to the figure's titles
        @figure.titles << Title.find_by(name: params[:title][:name])

      else
        # otherwise, create a new title and add it to the figure's titles
        @figure.titles << Title.create(params[:title])
      end
    end

    if !params[:landmark][:name].empty?
      if Landmark.all.detect { |landmark| landmark.name == params[:landmark][:name]}
        @figure.landmarks << Landmark.find_by(name: params[:landmark][:name])
      else
        @figure.landmarks << Landmark.create(params[:landmark])
      end
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end


  #Read
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show'
  end

  #Update
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]

    

    if !params[:title][:name].empty?
      if Title.all.detect { |title| title.name == params[:title][:name] } && !@figure.titles.detect { |title| title.name == params[:title][:name] }
        #if the title exists but is not associated with the figure, associate it with the figure.
        @figure.titles << Title.find_by(name: params[:title][:name])
      else
        @figure.titles << Title.create(params[:title])
      end
    end

    if !params[:landmark][:name].empty?
      if Landmark.all.detect { |landmark| landmark.name == params[:landmark][:name] } && !@figure.landmarks.detect { |landmark| landmark.name == params[:landmark][:name] }
        #if the title exists but is not associated with the figure, associate it with the figure.
        @figure.landmarks << Landmark.find_by(name: params[:landmark][:name])
      else
        @figure.landmarks << Landmark.create(params[:landmark])
      end
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"

  end

  #Destroy

  post '/figures/:id/delete' do

  end

end
