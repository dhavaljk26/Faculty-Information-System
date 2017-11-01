# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171101191000) do

  create_table "academic_degrees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "programme", null: false
    t.integer "min_duration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "academic_degrees_departments", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "academic_degree_id"
    t.bigint "department_id"
    t.index ["academic_degree_id"], name: "index_academic_degrees_departments_on_academic_degree_id"
    t.index ["department_id"], name: "index_academic_degrees_departments_on_department_id"
  end

  create_table "achievements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "faculty_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_achievements_on_faculty_id"
  end

  create_table "course_pre_requisites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "course_id"
    t.bigint "course_pre_requisite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_pre_requisites_on_course_id"
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "credits", null: false
    t.string "ltp", null: false
    t.string "course_type", null: false
    t.bigint "academic_degree_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_degree_id"], name: "index_courses_on_academic_degree_id"
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "courses_faculties", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "course_id"
    t.bigint "faculty_id"
    t.index ["course_id"], name: "index_courses_faculties_on_course_id"
    t.index ["faculty_id"], name: "index_courses_faculties_on_faculty_id"
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "department_type", null: false
    t.bigint "department_head_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_head_id"], name: "fk_rails_6289818807"
  end

  create_table "experiences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "faculty_id"
    t.text "description"
    t.string "institute"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_experiences_on_faculty_id"
  end

  create_table "faculties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name"
    t.string "designation", null: false
    t.date "joining_date", null: false
    t.string "office_phone_no", null: false
    t.string "mobile_no", null: false
    t.date "birth_date", null: false
    t.string "gender", null: false
    t.string "office_address_locality", null: false
    t.string "office_address_city", null: false
    t.string "office_address_state", null: false
    t.string "office_address_country", null: false
    t.integer "office_address_pin_code", null: false
    t.string "home_address_locality", null: false
    t.string "home_address_city", null: false
    t.string "home_address_state", null: false
    t.string "home_address_country", null: false
    t.integer "home_address_pin_code", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.bigint "department_id"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_faculties_on_department_id"
  end

  create_table "faculties_projects", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "faculty_id"
    t.bigint "project_id"
    t.index ["faculty_id"], name: "index_faculties_projects_on_faculty_id"
    t.index ["project_id"], name: "index_faculties_projects_on_project_id"
  end

  create_table "faculties_publications", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "faculty_id"
    t.bigint "publication_id"
    t.index ["faculty_id"], name: "index_faculties_publications_on_faculty_id"
    t.index ["publication_id"], name: "index_faculties_publications_on_publication_id"
  end

  create_table "interest_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "faculty_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_interest_areas_on_faculty_id"
  end

  create_table "leave_applications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "faculty_id"
    t.date "leaving_date"
    t.integer "no_of_days"
    t.text "reason"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_leave_applications_on_faculty_id"
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "funding_agency"
    t.integer "fund_amount"
    t.date "due_date", null: false
    t.string "other_contributors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title", null: false
    t.string "journal", null: false
    t.string "publisher", null: false
    t.date "publish_date", null: false
    t.string "other_contributors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "faculty_id"
    t.string "degree_name"
    t.string "degree_major"
    t.string "institution"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_qualifications_on_faculty_id"
  end

  add_foreign_key "academic_degrees_departments", "academic_degrees"
  add_foreign_key "academic_degrees_departments", "departments"
  add_foreign_key "achievements", "faculties"
  add_foreign_key "course_pre_requisites", "courses"
  add_foreign_key "courses", "academic_degrees"
  add_foreign_key "courses", "departments"
  add_foreign_key "courses_faculties", "courses"
  add_foreign_key "courses_faculties", "faculties"
  add_foreign_key "departments", "faculties", column: "department_head_id"
  add_foreign_key "experiences", "faculties"
  add_foreign_key "faculties", "departments"
  add_foreign_key "faculties_projects", "faculties"
  add_foreign_key "faculties_projects", "projects"
  add_foreign_key "faculties_publications", "faculties"
  add_foreign_key "faculties_publications", "publications"
  add_foreign_key "interest_areas", "faculties"
  add_foreign_key "leave_applications", "faculties"
  add_foreign_key "qualifications", "faculties"
end
