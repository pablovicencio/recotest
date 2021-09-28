class CambiarTipoDatoFromToAlert < ActiveRecord::Migration[6.0]
  def change
    change_column(:alerts, :from_alert, :integer)
    change_column(:alerts, :to_alert, :integer)
  end
end
