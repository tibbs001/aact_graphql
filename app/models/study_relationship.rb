class StudyRelationship < ApplicationRecord
  self.abstract_class = true;
  belongs_to :study, :foreign_key=> 'nct_id'
end
