module Types
  class CountryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :removed, Boolean, null: true
  end
end
