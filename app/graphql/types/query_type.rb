module Types
#  class QueryType < Types::BaseObject
  class QueryType < GraphQL::Schema::Object
    description "The root of this schema"

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :studies, function: Resolvers::StudiesSearch

    field :study, Types::StudyType, null: true do
      description 'Find a study by NCT ID'
      argument :nctId, String, required: false
    end

    field :condition, [Types::ConditionType], null: true do
      description 'Find studies for a condition'
      argument :name, String, required: false
    end

    field :intervention, [Types::InterventionType], null: true do
      description 'Find studies for an intervention'
      argument :name, String, required: false
    end

    field :sponsor, [Types::SponsorType], null: true do
      description 'Find a sponsor'
      argument :name, String, required: false
      argument :agency_class, String, required: false
    end

    def study(nct_id:)
      Study.where('nct_id =?', nct_id).first
    end

    def condition(name:)
      Condition.where('downcase_name like ?', "%#{name.downcase}%")
    end

    def intervention(name:)
      Intervention.where('downcase_name like ?', "%#{name.downcase}%")
    end

  end
end
