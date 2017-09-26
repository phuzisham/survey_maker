require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/survey')
require('./lib/question')
require('./lib/answer')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

get('/') do
  erb(:index)
end

get('/add_survey') do
  @surveys = Survey.all()
  erb(:add_survey)
end

get('/choose_survey') do
  @surveys = Survey.all()
  erb(:choose_survey)
end

get('/take_survey/:id') do
  @survey = Survey.find(params['id'])
  @questions = @survey.questions
  erb(:take_survey)
end

post('/create_survey') do
  title = params["title"]
  @survey = Survey.new({:title => title})
  if @survey.save()
    redirect('/add_survey')
  else
    erb(:errors)
  end
end

get("/survey/:id") do
  @survey = Survey.find(params["id"])
  erb(:survey)
end

post("/survey/:id") do
  @survey = Survey.find(params["id"])
  survey_id = @survey.id
  question = params['question']
  Question.create({:question => question, :survey_id => survey_id})
  erb(:survey)
end

patch("/survey/:id") do
  @survey = Survey.find(params["id"])
  title = params["title"]
  @survey.update({:title => title})
  erb(:survey)
end

delete("/survey/:id") do
  @survey = Survey.find(params["id"])
  @survey.questions.each { |q| q.delete }
  @survey.delete
  redirect "/"
end

get("/question/:id") do
  @question = Question.find(params["id"])
  erb(:question)
end

post("/question/:id") do
  @question = Question.find(params["id"])
  question_id = @question.id
  answer = params['answer']
  Answer.create({:answer => answer, :question_id => question_id})
  erb(:question)
end

delete("/question/:id") do
  @question = Question.find(params["id"])
  id = @question.survey_id
  @question.delete
  redirect "/survey/#{id}"
end
