class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :cert_no
      t.string :name
      t.string :course
      t.datetime :passed_date
    end
  end
end
