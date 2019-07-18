class Mutations::CreateStudy < GraphQL::Schema::Mutation
  name 'create_study'
  null true
  description 'Create new study'

  argument :id, types.ID
  argument :brief_title, types.String
  argument :study_type, types.String

  field :study, Types::StudyType, null: true
  field :errors, [String], null: false

  def resolve(id:, brief_title:, study_type:)
    study = Study.new(id: id, brief_title: brief_title, study_type: study_type)
    if study.save
      {study: study, errors: []}
    else
      {study: study, errors: study.errors.full_messages}
    end
  end

end
