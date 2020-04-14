# frozen_string_literal: true

class DropAddresses < ActiveRecord::Migration[6.0]
  def change
    drop_table :addresses
  end
end
