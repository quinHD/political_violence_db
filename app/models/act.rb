class Act < ApplicationRecord
  acts_as_paranoid

  belongs_to :creator, class_name: :User, foreign_key: "user_id"
  has_and_belongs_to_many :act_types
  has_and_belongs_to_many :act_organizations
  has_and_belongs_to_many :act_targets

  has_one :result
  accepts_nested_attributes_for :result
  has_one :place, dependent: :destroy
  accepts_nested_attributes_for :place
  has_many :modifications
  has_many :sources

  has_many :act_organizations_extended
  has_many :act_targets_extended

  validates :name, presence: true

  def self.extended_search(extended_search_params)
    result_query = all
    return result_query if extended_search_params.blank?
    search_act_organization_ids = extended_search_params[:act_organizations].reject(&:blank?)
    result_query = result_query.select{ |act| search_act_organization_ids.map(&:to_i).all? { |org| act.act_organizations_extended.map(&:id).include?(org) }}
    search_act_target_ids = extended_search_params[:act_targets].reject(&:blank?)
    result_query.select{ |act| search_act_target_ids.map(&:to_i).all? { |org| act.act_targets_extended.map(&:id).include?(org) }}
  end

  def act_organizations_extended
    act_organizations.reduce([]) { |a, e| a | e.path }
  end

  def act_targets_extended
    ActTarget.where(id: a.act_targets_extended.pluck(:id).uniq)
    act_targets.reduce([]) { |a, e| a | e.path }
  end

  def create_modification(current_u)
    val = previous_changes.reject {|k,v| k == "updated_at"}
    val.each do |k,v|
      modifications.create(
        creator: User.first, 
        column: k,
        from_value: v.first,
        to_value: v.last
      )
    end
  end
end
