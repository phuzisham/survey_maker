ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("pry")
require("sinatra/activerecord")
require("question")
require("survey")
require("answer")

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |x|
      x.destroy()
    end
    Question.all().each() do |x|
      x.destroy()
    end
    Answer.all().each() do |x|
      x.destroy()
    end
  end
end
