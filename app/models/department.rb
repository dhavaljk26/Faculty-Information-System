class Department < ApplicationRecord

  has_many :faculties, :dependent => :nullify
  has_many :courses, :dependent => :delete_all

  has_and_belongs_to_many :academic_degrees
end
