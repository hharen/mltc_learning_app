# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_915_144_113) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'courses', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'what_students_learn', array: true
  end

  create_table 'lessons', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'description'
    t.string 'content'
    t.integer 'order', null: false
    t.bigint 'topics_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['topics_id'], name: 'index_lessons_on_topics_id'
  end

  create_table 'materials', force: :cascade do |t|
    t.string 'type', null: false
    t.string 'body'
    t.bigint 'lessons_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['lessons_id'], name: 'index_materials_on_lessons_id'
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'course_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_subscriptions_on_course_id'
    t.index ['user_id'], name: 'index_subscriptions_on_user_id'
  end

  create_table 'topics', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'order', null: false
    t.bigint 'course_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_topics_on_course_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.boolean 'is_admin', default: false, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'lessons', 'topics', column: 'topics_id'
  add_foreign_key 'subscriptions', 'courses'
  add_foreign_key 'subscriptions', 'users'
  add_foreign_key 'topics', 'courses'
end
