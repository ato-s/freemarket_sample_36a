class AddReprtTypeToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :report_type, :integer , null:false, default: 0
  end
end
