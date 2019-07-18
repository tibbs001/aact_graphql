module Types
  class InterventionType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :downcase_name, String, null: true
  end
end
