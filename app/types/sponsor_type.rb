module Types
  class SponsorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :agency_class, String, null: true
    field :lead_or_collaborator, String, null: true
  end
end
