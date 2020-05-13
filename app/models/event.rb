class Event < ApplicationRecord
  validates :start_date, presence: true # ajouter : "ne doit pas être dans le passé"
  validates :duration, presence: true # ajouter : "multiple de 5 et positif"
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true#, length: { in: 20..1000 }
  validates :price, presence: true, length: { in: 1..1000 }
  validates :location, presence: true

  has_many :attendances
  has_many :users, through: :attendances
end
