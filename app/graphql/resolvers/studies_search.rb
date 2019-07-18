require 'search_object/plugin/graphql'

class Resolvers::StudiesSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { Study.all }

  type types[Types::StudyType]

  # inline input type definition for the advance filter
  class StudyFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :title_contains, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: StudyFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Study.all
    #scope = scope.like(:brief_title, value[:title_contains]) if value[:title_contains]
    scope = scope.where('brief_title like ?', "%#{value[:title_contains]}%") if value[:title_contains]

    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end
