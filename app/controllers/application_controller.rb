class ApplicationController < Sinatra::Base
  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  get '/' do
    @questions = Questions.all
    erb :index
  end

  get "/questions/new" do
    @question = Question.new
    erb :"question/new"
  end

  post "/questions" do
    @question = Question.new(params[:question])

    if question.save
      redirect to("/questions")
    else
      erb :"questions/new"
  end


end
