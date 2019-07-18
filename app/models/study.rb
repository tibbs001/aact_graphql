class Study < ApplicationRecord
  self.primary_key = 'nct_id'
  has_many :conditions,      :foreign_key => 'nct_id'
  has_many :countries,       :foreign_key => 'nct_id'
  has_many :interventions,   :foreign_key => 'nct_id'
  has_many :sponsors,        :foreign_key => 'nct_id'
end
