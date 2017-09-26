require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/survey')
require('./lib/question')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post('/create_survey') do
  title = params["title"]
  @survey = Survey.new({:title => title})
  if @survey.save()
    redirect('/')
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
  @survey.delete
  redirect "/"
end
