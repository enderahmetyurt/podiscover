class AddDailyOpenaiCreditToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :daily_openai_credit, :integer, default: 0, null: false
  end
end
