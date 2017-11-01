class Faculty < ApplicationRecord

  has_secure_password

  belongs_to :department

  has_many :achievements, :dependent => :destroy
  has_many :experiences, :dependent => :destroy
  has_many :qualifications, :dependent => :destroy
  has_many :interest_areas, :dependent => :destroy

  has_and_belongs_to_many :projects
  has_and_belongs_to_many :publications
  has_and_belongs_to_many :courses
end
