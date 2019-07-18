module Types
#  class QueryType < Types::BaseObject
  class QueryType < GraphQL::Schema::Object
    description "The root of this schema"

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :studies, function: Resolvers::StudiesSearch

    field :study, Types::StudyType, null: true do
      description 'Find a study by NCT ID'
      argument :id, String, required: false
      argument :brief_title, String, required: false
      argument :study_type, String, required: false
      argument :phase, String, required: false
    end

    field :condition, Types::ConditionType, null: true do
      description 'Find a condition'
      argument :id, ID, required: false
      argument :name, String, required: false
      argument :downcase_name, String, required: false
    end

    field :intervention, Types::InterventionType, null: true do
      description 'Find a intervention'
      argument :name, String, required: false
      argument :downcase_name, String, required: false
    end

    field :sponsor, Types::SponsorType, null: true do
      description 'Find a sponsor'
      argument :name, String, required: false
      argument :agency_class, String, required: false
      argument :downcase_name, String, required: false
    end

    def study(id:)
      Study.find_by_nct_id(id)
    end

    def condition(id:)
      Condition.find(id)
    end

  end
end
