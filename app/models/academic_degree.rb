class AcademicDegree < ApplicationRecord

  has_many :courses, :dependent => :nullify

  has_and_belongs_to_many :departments
end
