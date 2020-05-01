class ChangeRegistrationIdOnUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :registration_id, :string
    end
  end

  def self.down
    change_table :users do |t|
      t.change :registration_id, :integer
    end
  end
end
