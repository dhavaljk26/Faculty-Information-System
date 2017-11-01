class Course < ApplicationRecord
  belongs_to :academic_degree
  belongs_to :department

  has_many :course_pre_requisites, :dependent => :destroy

  has_and_belongs_to_many :faculties
end
