class AddPrizeToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :prize,:float
  end
end
