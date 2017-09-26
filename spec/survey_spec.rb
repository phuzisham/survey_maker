require('spec_helper')

describe(Survey) do
  describe('#questions') do
    it('will tell which questions belong to this survey') do
      test_survey = Survey.create({:title => 'What!?'})
      test_question1 = Question.create({:question => 'Why?', :survey_id => test_survey.id})
      test_question2 = Question.create({:question => 'Who?', :survey_id => test_survey.id})
      expect(test_survey.questions).to(eq([test_question1, test_question2]))
    end
  end

  describe("#validate") do
    it("Capitalize survey title") do
      survey = Survey.create(:title => 'punk brewster?')
      expect(survey.title).to eq('Punk Brewster?')
    end
  end

end
