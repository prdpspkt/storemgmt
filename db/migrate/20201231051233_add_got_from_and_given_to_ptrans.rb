class AddGotFromAndGivenToPtrans < ActiveRecord::Migration[5.2]
  def change
    add_column :peirts, :taken_from, :integer
    add_column :pneirts, :taken_from, :integer
    add_column :peirts, :given_to, :integer
    add_column :pneirts, :given_to, :integer
  end
end
