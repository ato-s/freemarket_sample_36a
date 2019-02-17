class Report < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user_id, :item_id, :report_type, presence: true

  enum report_type: {
    fake_or_infringing_goods: 1,
    pharmaceuticals_or_medical_equipments: 2,
    violation_pharmaceutical_laws: 3,
    dangerous_goods: 4,
    pornographies: 5,
    adults: 6,
    violation_firearm_and_sword_law: 7,
    cash_or_counterfeit_cash_and_tickets: 8,
    other_services_or_direct_transactions_or_exchange: 9,
    publicity_or_searching: 10,
    other: 11,
  }

end

