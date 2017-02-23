class ActTarget < ApplicationRecord
  has_ancestry
  has_and_belongs_to_many :acts
  has_many :act_targets, source: :ancestry

  scope :targets, -> { where(label: TARGET) }
  scope :target_categories, -> { where(label: CATEGORY) }
  scope :target_subcategories, -> { where(label: SUBCATEGORY) }

  validates :name, presence: true

  TARGET = "target"
  CATEGORY = "target_category"
  SUBCATEGORY = "target_subcategory"

  HIERARCHY = [TARGET, CATEGORY, SUBCATEGORY]

  def child_label
    current = HIERARCHY.index(label)
    HIERARCHY[current+1]
  end
end
