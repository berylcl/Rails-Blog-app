# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def self.up
    unless column_exists?(:users, :email)
      change_table :users do |t|
        ## Database authenticatable
        t.string :email, null: false, default: ""
        t.string :encrypted_password, null: false, default: ""

        ## Recoverable
        t.string   :reset_password_token
        t.datetime :reset_password_sent_at

        ## Rememberable
        t.datetime :remember_created_at

        ## Confirmable
        t.string   :confirmation_token
        t.datetime :confirmed_at
        t.datetime :confirmation_sent_at
        t.string   :unconfirmed_email # Only if using reconfirmable

        # ... (rest of your migration code)

        add_index :users, :email, unique: true
      end
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
