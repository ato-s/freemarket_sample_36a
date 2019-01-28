module ApplicationHelper
  def full_address(address)
    return "#{address.postal_code} #{address.prefecture} #{address.city}"
  end
end
