module ApplicationHelper
  def full_address(address)
    "#{address.postal_code} #{address.prefecture} #{address.city}"
  end
end
