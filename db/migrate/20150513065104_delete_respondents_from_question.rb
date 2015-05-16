class DeleteRespondentsFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :respondents
  end
end
