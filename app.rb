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
  Survey.create({:title => title})
  redirect('/')
end
