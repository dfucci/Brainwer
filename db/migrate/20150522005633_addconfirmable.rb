class Addconfirmable < ActiveRecord::Migration
  def self_up
    change_table(:users) do |t|
      t.confirmable
    end
  end
end
