class AddFioToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :fio, :string
  end
end
