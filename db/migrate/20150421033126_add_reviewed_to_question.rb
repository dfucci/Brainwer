class AddReviewedToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :reviewed, :boolean
  end
end
