class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
    add_index :answers, :question_id
  end
end
