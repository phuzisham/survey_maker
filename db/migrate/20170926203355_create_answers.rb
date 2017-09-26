class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table(:answers) do |a|
      a.column(:answer, :string)
      a.column(:question_id, :integer)

      a.timestamps()
    end
  end
end
