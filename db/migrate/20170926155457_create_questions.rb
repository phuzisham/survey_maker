class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |q|
      q.column(:question, :string)
      q.column(:survey_id, :integer)

      q.timestamps()
    end
  end
end
