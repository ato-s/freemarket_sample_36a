# DB設計

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false, unique:ture|
|profile|text||
|uid|string|null:false, default:""|
|provider|string|null:false, default:""|
|good_count|integer|null:false, default:0|
|normal_count|integer|null:false, default:0|
|bad_count|integer|null:false, default:0|

### Association
- has_many :reports, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :transaction_messages, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :avatars, dependent: :destroy, inverse_of: :user
- has_many :credits,dependent: :destroy
- has_one :phone_number, dependent: :destroy
- accepts_nested_attributes_for :avatars, allow_destroy: true

- has_many :sell_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :destroy
- has_many :buy_items, class_name: 'Item', foreign_key: 'buyer_id', dependent: :destroy
- has_many :sent_reviews, class_name: 'Review', foreign_key: 'appraiser_id'
- has_many :received_reviews, class_name: 'Review', foreign_key: 'appraisee_id'

# phone_numbersテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null:false, unique: true|
|verification_code|integer||
|verification_code_confirmation|integer||
|verified|boolean|null:false, default: false|
|user_id|integer|null:false, foreign_key: true|


### Association
- belongs_to :user

# addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|postal_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|adress|string|null:false|
|building_name|string|null:false|
|landline_number|integer|null:false|

### Association
- belonsgs_to :user
- has_many :deliverd_items, class_name: 'Item', foreign_key: 'shipping_address_id'


# avatarsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|content|text|null:false|

### Association
- belongs_to :user


# reportsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item


# likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item, counter_cache:like_count


# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|
|text|text|null:false|

### Association
- belongs_to :user
- belongs_to :item

# reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false, foreign_key:true|
|appraiser_id|integer|null:false, foreign_key:true, index:true|
|appraisee_id|integer|null:false, foreign_key:ture, index:true|
|evaluation|integer|null:false, default:0|
|text|text|null:false, default:“”|

- enum evaluation: { error: 0, good: 1, normal: 2, bad: 3 }

### Association
- belongs_to :user
- belongs_to :item


# walletsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|money|integer|null:false, default:0|
|point|integer|null:false, default:0|

### Association
- belongs_to :user
- has_many :withdraws


# creditsテーブル
|Column|Type|Options|
|------|----|-------|
|credit_number|string|null:false,uniqueness:true|
|limit_month|string|null:false,length:2|
|limit_year|string|null:false,length:2|
|security_code|string|null:false|
|customer_id|string|null:false,uniqueness:true|
|user_id|integer|null:false,foreign_key:true|

### Association
- belongs_to : user


# withdrawalsテーブル
|Column|Type|Options|
|------|----|-------|
|walet_id|integer|null:false, foreign_key:true|
|withdrawal_price|integer|null:false|

### Association
- belongs_to :wallet


# informationsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false, foreign_key:true|
|infomation_type|integer|null:false, default:0|
|text|text|null:false, default:""|
|changed_price|integer|null:false, default:0|
|changed_stage|integer|null:false, default:0|

### Association
- belongs_to :user
- belongs_to :item
- has_many :user_informations


# infomationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|infomation_id|integer|null:false, foreign_key:true|

### Association
- belongs_to :user_information
- belongs_to :user


# todosテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|
|todo_type|integer|null:false|
|text|text|null:false|

### Association
- belongs_to :user
- belongs_to :item

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false, default:""|
|description|text||
|state|integer|null:false, default:0|
|delivery_payer|integer|null:false, default:0|
|delivery_region|integer|null:false, default:0|
|delivery_duration|integer|null:false, default:0|
|buy_price|integer|null:false, default:0|
|sell_price|integer|null:false, default:0|
|commition_price|integer|null:false, default:0|
|transaction_stage|integer|null:false, default:0|
|like_count|integer|null:false, default:0|
|size_id|integer|null:false, foreign_key:true, default:0|
|brand_id|integer|null:false, foreign_key:true, default:0|
|upper_category_id|integer|null:false, foreign_key:true|
|middle_category_id|integer|null:false, foreign_key:true|
|lower_category_id|integer|null:false, foreign_key:true|
|seller_id|integer|null:false, add_foreign_key :items, :users, column: :seller_id, index:true|
|buyer_id|integer|add_foreign_key :items, :users, column: :buyer_id, index:true|
|shipping_address_id|integer|add_foreign_key :items, :addresses, column: :shipping_address_id, index:true|

### Association
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id', optional: true
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :shipping_address, class_name: 'Address', foreign_key: 'shipping_address_id', optional: true
  belongs_to :upper_category, optional: true
  belongs_to :middle_category, optional: true
  belongs_to :lower_category, optional: true

  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :transaction_messages, dependent: :destroy
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true


# transaction_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|
|text|text|null:false, default:""|

### Association
- belongs_to : user
- belongs_to : item


# picturesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false, foreign_key:true|
|content|string|null:false, default:””|
|status|integer|null:false, default:0|

### Association
- belongs_to : item


# brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|initial_word|string|null:false|

### Association
- has_many : items
- has_many : groups,through: :brand_group


# brand_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null:false, foreign_key:true|
|group_id|integer|null:false, foreign_key:true|

### Association
- belongs_to : brad
- belongs_to : group


# groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
- has_many : brand, through: :brand_groups


# upper_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
- has_many : items
- has_many : middle_categorys


# middle_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|upper_category_id|integer|null:false,foreign_key:true|
|size_type_id|integer|null:false, foreign_key:true|

### Association
- has_many : items
- belongs_to : upper_category
- has_many : lower_categorys
- belongs_to : size_type


# lower_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|middle_category_id|integer|null:false, foreign_key:true|

### Association
- belongs_to : middle_category
- has_many : items


# sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|size_type_id|integer|null:false, foreign_key:true|

### Association
- has_many : items
- belongs_to : size_type


# size_typesテーブル
|Column|Type|Options|
|------|----|-------|
|size_type|string|null:false|

### Association
- has_many : sizes
- has_many : middle_categorys
