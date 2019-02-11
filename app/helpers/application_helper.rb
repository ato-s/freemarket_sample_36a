module ApplicationHelper
  def full_address(address)
    "#{address.postal_code} #{address.prefecture} #{address.city}"
  end

  def information_messages(information)
    if information.information_type == 'be_discounted'
      "あなたがいいねした#{information.stakeholder.nickname}の#{information.related_item.name}が\n#{information.originally_price}円から#{information.changed_price}円に変更されました。"
    elsif information.information_type == 'be_evaluated'
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}を評価しました"
    elsif information.information_type == 'be_liked'
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}にいいねしました"
    elsif information.information_type == 'be_purchased'
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}を購入しました"
    elsif information.information_type == 'be_shiped'
      "#{information.stakeholder.nickname}が#{information.related_item.name}を発送しました"
    elsif information.information_type == 'transaction_has_been_finished' && information.stakeholder != current_user
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}を評価しました\n取引は以上で完了です。"
    elsif information.information_type == 'transaction_has_been_finished' && information.stakeholder == current_user
      "#{information.related_item.name}の取引が完了しました。\n#{information.related_item.sell_price}円が入金されました。"
    elsif information.information_type == 'be_commented'
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}にコメントしました"
    end
  end

  def todo_messages(todo)
    if todo.todo_stage == 'ship_it'
      "#{todo.item.name}を発送し、発送連絡を行なってください。"
    elsif todo.todo_stage == 'review_if_buyer_received'
      "#{todo.item.name}の受け取りが完了したら、評価してください。"
    elsif todo.todo_stage == 'review_and_receive_money'
      "#{todo.item.name}の評価を行ってください。\n評価完了後に入金されます。"
    end
  end
end
