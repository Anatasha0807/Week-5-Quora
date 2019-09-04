   class ApplicationController < Sinatra::Base
  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  set :method_override, true

  get '/' do
    erb :index
  end

  get '/questions' do
    @questions = Question.all
    erb :"questions/index"
  end

  get "/questions/new" do
    @question = Question.new
    erb :"questions/new"
  end

  # read (index/show)
  get "/questions/:id" do
    @question = Question.find(params[:id])
    erb :"questions/show"
  end

  post "/questions" do
    @question = Question.new(params[:question])

    if @question.save
      redirect to("/questions")
    else
      erb :"questions/new"
    end
  end

  get "/questions/edit/:id" do
     @question = Question.find(params[:id])
     erb :"questions/edit"
  end

  # update
  patch "/questions/:id" do
    @question = Question.find(params[:id])
    @question.update(params[:question])
    redirect to("/questions")
  end

#delete
  delete "/questions/:id/delete" do
    @question = Question.find(params[:id])
    @question.destroy
    redirect to("/questions")
  end

  post '/answer' do
    @answer = Answer.new(params[:answer])

    if @answer.save
      redirect to("/questions/#{@answer.question.id}")
    else
      redirect to("/questions")
    end
  end
end
