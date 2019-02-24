module ApplicationHelper
  def full_address(address)
    "#{address.postal_code} #{address.prefecture} #{address.city}"
  end

  def information_messages(information)
    if information.be_discounted?
      "あなたがいいねした#{information.stakeholder.nickname}の#{information.related_item.name}が\n#{information.originally_price}円から#{information.changed_price}円に変更されました。"
    elsif information.be_evaluated?
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}を評価しました"
    elsif information.be_liked?
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}にいいねしました"
    elsif information.be_purchased?
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}を購入しました"
    elsif information.be_shiped?
      "#{information.stakeholder.nickname}が#{information.related_item.name}を発送しました"
    elsif information.transaction_has_been_finished? && information.stakeholder != current_user
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}を評価しました\n取引は以上で完了です。"
    elsif information.transaction_has_been_finished? && information.stakeholder == current_user
      "#{information.related_item.name}の取引が完了しました。\n#{information.related_item.sell_price}円が入金されました。"
    elsif information.be_commented?
      "#{information.stakeholder.nickname}があなたの#{information.related_item.name}にコメントしました"
    end
  end

  def todo_messages(todo)
    if todo.ship_it?
      "#{todo.item.name}を発送し、発送連絡を行なってください。"
    elsif todo.review_if_buyer_received?
      "#{todo.item.name}の受け取りが完了したら、評価してください。"
    elsif todo.review_and_receive_money?
      "#{todo.item.name}の評価を行ってください。\n評価完了後に入金されます。"
    end
  end

  def mypage_item_head(item)
    if current_page?(index_under_transaction_items_path)
      '購入した商品 - 取引中'
    elsif current_page?(index_sold_out_items_path)
      '購入した商品 - 過去の取引'
    elsif current_page?(index_sell_items_path)
      '出品した商品 - 出品中'
    elsif current_page?(index_under_transaction_sell_items_path)
      '出品した商品 - 取引中'
    elsif current_page?(index_sold_out_sell_items_path)
      '出品した商品 - 売却済み'
    end
  end

  def mypage_item_not_found(item)
    if current_page?(index_under_transaction_items_path)
      '現在、取引中の商品はありません'
    elsif current_page?(index_sold_out_items_path)
      '過去に購入した商品はありません'
    elsif current_page?(index_sell_items_path)
      '現在、出品中の商品はありません'
    elsif current_page?(index_under_transaction_sell_items_path)
      '現在、取引中の商品はありません'
    elsif current_page?(index_sold_out_sell_items_path)
      '売却済みの商品はありません'
    end
  end

  def item_box_message(item)
    if current_user.id == item.buyer_id
      if item.purchased?
        "#{item.name}を購入しました。発送をお待ちください"
      elsif item.shipping?
        "#{item.name}が発送されました。商品受取完了後、受取評価をしてください"
      elsif item.evaluated?
        "#{item.name}の受取評価を行いました。出品者の評価をお待ちください"
      elsif item.transaction_completed?
        "#{item.name}の取引が完了しました"
      end
    else
      if item.under_sale?
        "#{item.name}を出品しました"
      elsif item.purchased?
        "#{item.name}が購入されました。商品を発送し、発送通知を行なってください"
      elsif item.shipping?
        "#{item.name}の発送を通知しました。購入者の受取評価をお待ちください"
      elsif item.evaluated?
        "#{item.name}が受取評価されました。購入者の評価をしてください"
      elsif item.transaction_completed?
        "#{item.name}の取引が完了しました"
      end
    end
  end

  def attention_span_message(item)
    if current_user == item.buyer
      if item.purchased?
        '発送をお待ちください'
      elsif item.shipping?
        '受取評価をしてください'
      elsif item.evaluated?
        '出品者の評価をお待ちください'
      elsif item.transaction_completed?
        '取引は完了しました'
      end
    else
      if item.purchased?
        '商品を発送してください'
      elsif item.shipping?
        '商品の発送を通知しました'
      elsif item.evaluated?
        '購入者の評価をしてください'
      elsif item.transaction_completed?
        '取引は完了しました'
      end
    end
  end

  def attention_p_message(item)
    if current_user == item.buyer
      if item.purchased?
        '出品者からの発送通知をお待ちください'
      elsif item.shipping?
        '商品の受取を確認し、出品者を評価してください'
      elsif item.evaluated?
        '出品者の評価で取引は完了です'
      end
    else
      if item.purchased?
        '商品が購入され支払いされました。商品の発送を行なってください'
      elsif item.shipping?
        '購入者の受取確認と評価をしばらくお待ちください'
      elsif item.evaluated?
        '評価完了後、入金されます'
      end
    end
  end
end
