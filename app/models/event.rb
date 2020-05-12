class Event < ApplicationRecord
  validates :start_date # ajouter : "ne doit pas être dans le passé"
  validates :duration # ajouter : "multiple de 5 et positif"
  validates :title, length: { in: 5..140 }
  validates :description, length: { in: 20..1000 }
  validates :price, length: { in: 1..1000 }
  validates :location

  has_many :attendances
  has_many :users, through: :attendances
end
