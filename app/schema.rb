class Schema < GraphQL::Schema
  query(Types::QueryType)
end


query_string = "
{
  condition(id: 6864045) {
    id
    name
    downcaseName
  }
}"

query_string = "
{
  study(id: NCT01643499) {
    briefTitle
    startDate
    overallStatus
    studyType
    phase
    countries {
      name
      removed
    }
    interventions {
      name
    }
    conditions {
      name
    }
    interventions {
      name
    }
    sponsors {
      name
      leadOrCollaborator
    }
  }
}"

result = Schema.execute(query_string)
