class CreateDb < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :email
      t.string :password_digest
      t.integer :year
      t.string :major
    end

    create_table :questions do |t|
      t.text :text
      t.string :category
      t.belongs_to :student
      t.belongs_to :course
    end

    create_table :answers do |t|
      t.text :text
      t.integer :upvotes
      t.belongs_to :question
      t.belongs_to :student
    end

    create_table :courses do |t|
      t.string :title
      t.string :subject
      t.string :catalog_number
      t.integer :section
      t.string :term
      t.belongs_to :professor
    end

    create_table :professors do |t|
      t.string :email
      t.string :password_digest
    end

    create_table :seen_questions do |t|
      t.belongs_to :question
      t.belongs_to :student
      t.boolean :seen
    end

    create_table :courses_students do |t|
      t.belongs_to :course
      t.belongs_to :student
    end

    

  end
end
