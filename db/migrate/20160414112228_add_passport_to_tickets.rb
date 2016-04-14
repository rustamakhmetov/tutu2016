class AddPassportToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :passport, :string
  end
end
