class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params['figure'])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
