module Types
  class StudyType < Types::BaseObject
    description "A clinical trial."

    field :nct_id, String, null: false
    field :start_date, Types::BaseScalar, null: true
    field :primary_completion_date, Types::BaseScalar, null: true
    field :study_type, String, null: true
    field :overall_status, String, null: true
    field :brief_title, String, null: true
    field :phase, String, null: true
    field :conditions, [Types::ConditionType], null: true
    field :countries, [Types::CountryType], null: true
    field :interventions, [Types::InterventionType], null: true
    field :sponsors, [Types::SponsorType], null: true
  end
end
