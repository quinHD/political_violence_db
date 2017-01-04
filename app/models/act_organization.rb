class ActOrganization < ApplicationRecord
  has_ancestry
  has_and_belongs_to_many :acts

  scope :organizations, -> { where(label: ORGANIZATION) }
  scope :organization_groups, -> { where(label: GROUP) }
  scope :organization_subgroups, -> { where(label: SUBGROUP) }

  ORGANIZATION = "organization"
  GROUP = "organization_group"
  SUBGROUP = "organization_subgroup"
end
