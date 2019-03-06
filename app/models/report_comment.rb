class ReportComment < ApplicationRecord

  belongs_to :user
  belongs_to :comment

  validates :user_id, :comment_id, :report_type, :issue, presence: true

  enum report_type: {
    violent_language_and_intimidation: 1,
    slander: 2,
    direct_trading_and_exchange: 3,
    publication_of_private_information: 4,
    induction_to_external_site: 5,
    others: 6
  }

end


