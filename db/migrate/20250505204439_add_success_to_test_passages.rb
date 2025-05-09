# frozen_string_literal: true

class AddSuccessToTestPassages < ActiveRecord::Migration[7.2]
  def change
    add_column :test_passages, :success, :boolean, default: false, null: false
  end
end
