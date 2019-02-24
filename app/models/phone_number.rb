class PhoneNumber < ApplicationRecord
  belongs_to :user
  validates :number, :verified, :user_id, presence: true
  validates :verified, inclusion: { in: [true, false] }

  VERIFICATION_CODE_LENGTH = 6

  after_create :issue_verification_code
  after_create :send_verification_code

  def verified_true
    if self.verification_code == self.verification_code_confirmation
      self.verified = true
      self.verification_code = nil
      self.save
    else
      self.verification_code_confirmation = nil
      return false
    end
  end

  private

  def issue_verification_code
    self.verification_code = VERIFICATION_CODE_LENGTH.times.map{ Random.rand(9) + 1 }.join
    self.save!
  end

  def send_verification_code
    twilio_client.messages.create(
      from: Rails.application.secrets.twilio_phone_number,
      to: formatted_mobile_phone_number,
      body: "この認証コードを入力してください。\n#{verification_code}"
    )
  end

  def twilio_client
    @client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]
  end

  # 080-1234-5678 => # +8180-1234-5678
  def formatted_mobile_phone_number
    "+81#{self.number[1..-1]}"
  end
end
