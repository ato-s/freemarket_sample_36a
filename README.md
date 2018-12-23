# DB設計

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|uid|string|null:false| *check
|provider|string|null:false| *check
|good_count|integer|null:false, default: 0|
|normal_count|integer|null:false, default: 0|
|bad_count|integer|null:false, default: 0|

### Association
- has_one : phone number
- has_one : adress
- has_one : creditcard
- has_one : avatar
- has_many : report
- has_many : like
- has_many : comment
- has_many : transaction message
- has_many : transaction
- has_many : item
- has_and_belongs_to_many : todo
- has_and_belongs_to_many : information
- has_many : user information
- has_one : walet
- has_many : review


# phoneNumberテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null:false,unique:true|
|user|references|null:false,foreign_key:true|


# addressテーブル
|Column|Type|Options|
|------|----|-------|
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
|user_id|integer|null:false|


# creditcardテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user|references|null:false|


# avatarテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null:false|
|user|references|null:false|


# reportテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false|
|item|references|null:false|

### Association
belongs_to : user


# likeテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false|
|item|references|null:false|

### Association
belongs_to : user

# commentテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false|
|item|references|null:false|
|sentence|text|null:false|

### Association
belongs_to : user

# reviewテーブル
|Column|Type|Options|
|------|----|-------|
|appraiser_id|integer|null:false,foreign_key,index:true|
|appraisee_id|integer|null:false,foreign_key,index:true|
|item|references|null:false,foreign_key: true|
|evaluation|integer|null:false, default: 0|
|text|text|null: false, default: “”|

### Association
belongs_to : user


# walletテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|point|integer|null:false,default:0|
|money|integer|null:false,default:0|

### Association
has_many:withdrawalhistory


# withdrawalHistoryテーブル
|Column|Type|Options|
|------|----|-------|
|walet_id|integer|null:false|
|withdrawal_price|integer|null:false|

### Association
belongs_to : wallet


# informationテーブル
|Column|Type|Options|
|------|----|-------|
|infomation_type|integer|null:false,default:0|
|item_id|integer|null:false|

### Association
has_and_belongs_to_many:user
has_many : user information

# userinfomationテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|infomation_id|integer|null:false,foreign_key:true|

### Association
belongs_to : userinformation
belongs_to : user


# todoテーブル
|Column|Type|Options|
|------|----|-------|
|todo_type|integer||
|text|text|null:false|
|item_id|integer|null:false|
|user_id|integer|null:false|

### Association
has_and_belongs_to_many:user


# itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false, default: ""|
|description|text|null:false, default: ""|
|state|integer|null:false, default: 0|
|sizer_id|references|foreign_key: true|
|delivery_payer|integer|null:false, default: 0|
|delivery_region|integer|null:false, default: 0|
|delivery_duration|integer|null:false, default: 0|
|buy_price|integer|null:false, default: 0|
|sell_price|integer|null:false, default: 0|
|commition_price|integer|null:false, default: 0|
|transaction_stage|integer|null:false, default: 0|
|like_count|integer|null:false, default: 0|
|brand_id|references|foreign_key: true|
|upper_category_id|references|foreign_key: true|
|middle_category_id|references|foreign_key: true|
|lower_category_id|references|foreign_key: true|
|seller_id||add_foreign_key :items, :users, column: :seller_id, index:true|
|buyer_id||add_foreign_key :items, :users, column: :buyer_id, index:true|

### Association
belongs_to:user
has_many:report
has_many:like
has_many:comment
has_many:transaction
has_many:picture
belongs_to:brand
has_many:uppercategory
has_many:middlecategory
has_many:lowercategory
belongs_to:size
has_many:todo
has_many:information
has_many:review


# transaction messageテーブル
|Column|Type|Options|
|------|----|-------|
|transaction_id|integer|null:false|
|user_id|integer|null:false|
|message|text|null:false,default:””|

### Association
belongs_to:tansaction
belongs_to:user


# transactionテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null:false|
|buyer_id|integer|null:false|
|item_id|integer|null:false,foreign_key:true|

### Association
has_many:transaction
belongs_to:user
belongs_to:item


# pictureテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null:false,default:””|
|status|integer|null:false,default:0|
|item_id|references|null:false,foreign_key:true|

### Association
belongs_to:item


# brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|initial_word|string|null:false|

### Association
has_many:item


# brand groupテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references|null:false,foreign_key:true|
|group_id|references|null:false,foreign_key:true|

### Association
has_many:item


# groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
has_many:brandgroup
has_and_belongs_to_many:brand


# upper categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
has_many:item
has_many:middlecategory


# middle categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|upper_category_id|integer|null:false|
|size_type_id|references|foreign_key:true|

### Association
has_many:item
belongs_to:uppercategory
has_many:lowercategory


# lower categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|middle_category_id|integer|null:false|

### Association



# sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|size_type_id|integer|null:false,foreign_key:true|

### Association



# sizetypyeテーブル
|Column|Type|Options|
|------|----|-------|
|size_type|string|null:false|

### Association
