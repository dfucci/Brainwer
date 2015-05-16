class AddRespndentsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :respondents, :string, array: true, default: '{}'
  end
end
