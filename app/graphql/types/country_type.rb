module Types
  class CountryType < Types::BaseObject
    field :nct_id, String, null: false
    field :name, String, null: true
    field :removed, Boolean, null: true
  end
end
