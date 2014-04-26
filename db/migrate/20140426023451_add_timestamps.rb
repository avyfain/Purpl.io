class AddTimestamps < ActiveRecord::Migration
  def change
    add_column(:students, :created_at, :datetime)
    add_column(:students, :updated_at, :datetime)

    add_column(:courses, :created_at, :datetime)
    add_column(:courses, :updated_at, :datetime)

    add_column(:questions, :created_at, :datetime)
    add_column(:questions, :updated_at, :datetime)

    add_column(:answers, :created_at, :datetime)
    add_column(:answers, :updated_at, :datetime)

    add_column(:professors, :created_at, :datetime)
    add_column(:professors, :updated_at, :datetime)
  end
end
