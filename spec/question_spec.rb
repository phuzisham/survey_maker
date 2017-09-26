require('spec_helper')

describe(Question) do
  describe('#survey') do
    it('will tell which survey the quwstion belongs to') do
      test_survey = Survey.create({:title => 'What!?'})
      test_question = Question.create({:question => 'Why?', :survey_id => test_survey.id})
      expect(test_question.survey).to(eq(test_survey))
    end
  end
end
