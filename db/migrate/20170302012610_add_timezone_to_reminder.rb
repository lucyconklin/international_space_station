class AddTimezoneToReminder < ActiveRecord::Migration[5.0]
  def change
    add_column :reminders, :timezone, :string
  end
end
