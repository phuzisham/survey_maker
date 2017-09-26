class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table(:results) do |r|
      r.column(:answer_id, :integer)

      r.timestamps()
    end
  end
end
