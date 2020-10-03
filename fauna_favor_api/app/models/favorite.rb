class Favorite < ApplicationRecord
    include Mongoid::Document

    field :primaryCommonName, type: String
    field :scientificName, type: String
    field :order, type: String
    field :iucn, type: String
    field :family, type: String
    field :genus, type: String
    field :barriers, type: String
    field :justification, type: String
    field :userId, type: String

    validates_presence_of :userId

end
