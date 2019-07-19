module Types
  class SponsorType < Types::BaseObject
    field :nct_id, String, null: false
    field :name, String, null: true
    field :agency_class, String, null: true
    field :lead_or_collaborator, String, null: true
  end
end
