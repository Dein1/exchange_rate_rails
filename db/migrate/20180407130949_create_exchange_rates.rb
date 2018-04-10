class CreateExchangeRates < ActiveRecord::Migration[5.1]
  def change
    create_table :exchange_rates do |t|
      t.float :rate
      t.datetime :date

      t.timestamps
    end
  end
end
