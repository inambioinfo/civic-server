class SourceSuggestion < ActiveRecord::Base
  belongs_to :source
  belongs_to :user

  validates :status, inclusion: { in: ['new', 'curated', 'rejected' ] }

  def self.datatable_scope
    eager_load(:user, :source)
  end

  def state_params
    {
      source: {
        id: source_id,
      }
    }
  end
end
