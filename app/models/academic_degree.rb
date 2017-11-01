class AcademicDegree < ApplicationRecord

  has_many :courses, :dependent => :delete_all

  has_and_belongs_to_many :departments
end
