# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      t.string :encrypted_password, null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :type, null: false, default: 'User'

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
    end

    remove_column         :users, :password_digest, :string
    remove_column         :users, :name, :string
    change_column_default :users, :email, ''

    add_index :users, :type
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
  end

  def self.down
    remove_column         :users, :encrypted_password, :string
    remove_column         :users, :reset_password_token, :string
    remove_column         :users, :reset_password_sent_at, :datetime
    remove_column         :users, :remember_created_at, :datetime
    remove_column         :users, :confirmation_token, :string
    remove_column         :users, :confirmed_at, :datetime
    remove_column         :users, :confirmation_sent_at, :datetime
    remove_column         :users, :unconfirmed_email, :string
    remove_column         :users, :first_name, :string
    remove_column         :users, :last_name, :string
    remove_column         :users, :type, :string
    add_column            :users, :password_digest, :string
    add_column            :users, :name, :string
    remove_index          :users, :email
    change_column_default :users, :email, nil
  end
end
