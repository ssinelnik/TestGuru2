class AddColumnPassingTimeToTest < ActiveRecord::Migration[7.2]
  def change
    add_column :tests, :passing_time, :integer, default: nil
  end
end
