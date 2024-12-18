# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[7.1]
  def change
    create_table :gists do |t|
      t.string :gist_hash, null: false
      t.string :gist_url, null: false
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
