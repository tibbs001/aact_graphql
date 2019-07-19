module Types
  class ConditionType < Types::BaseObject
    field :nct_id, String, null: false
    field :name, String, null: true
    field :downcase_name, String, null: true
    field :study, Types::StudyType, null: true
  end
end
