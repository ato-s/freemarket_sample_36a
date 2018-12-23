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
- has_one : phone_number
- has_one : adress
- has_one : creditcard
- has_one : avatar
- has_many : reports
- has_many : likes
- has_many : comments
- has_many : transaction_messages
- has_many : transactions
- has_many : items
- has_and_belongs_to_many : todo
- has_and_belongs_to_many : information
- has_many : user_informations
- has_one : walet
- has_many : reviews


# phone_numberテーブル
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
- belongs_to : user


# likeテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false|
|item|references|null:false|

### Association
- belongs_to : user

# commentテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false|
|item|references|null:false|
|sentence|text|null:false|

### Association
- belongs_to : user

# reviewテーブル
|Column|Type|Options|
|------|----|-------|
|appraiser_id|integer|null:false,foreign_key,index:true|
|appraisee_id|integer|null:false,foreign_key,index:true|
|item|references|null:false,foreign_key: true|
|evaluation|integer|null:false, default: 0|
|text|text|null: false, default: “”|

### Association
- belongs_to : user


# walletテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|point|integer|null:false,default:0|
|money|integer|null:false,default:0|

### Association
- has_many:withdrawalhistorys


# withdrawal_Historyテーブル
|Column|Type|Options|
|------|----|-------|
|walet_id|integer|null:false|
|withdrawal_price|integer|null:false|

### Association
- belongs_to : wallet


# informationテーブル
|Column|Type|Options|
|------|----|-------|
|infomation_type|integer|null:false,default:0|
|item_id|integer|null:false|

### Association
- has_and_belongs_to_many:user
- has_many : user informations


# user_infomationテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|infomation_id|integer|null:false,foreign_key:true|

### Association
- belongs_to : userinformation
- belongs_to : user


# todoテーブル
|Column|Type|Options|
|------|----|-------|
|todo_type|integer||
|text|text|null:false|
|item_id|integer|null:false|
|user_id|integer|null:false|

### Association
- has_and_belongs_to_many:user


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
- belongs_to:user
- has_many:reports
- has_many:likes
- has_many:comments
- has_many:transactions
- has_many:pictures
- belongs_to:brand
- has_many:upper_categorys
- has_many:middle_categorys
- has_many:lower_categorys
- belongs_to:size
- has_many:todos
- has_many:informations
- has_many:reviews


# transaction_messageテーブル
|Column|Type|Options|
|------|----|-------|
|transaction_id|integer|null:false|
|user_id|integer|null:false|
|message|text|null:false,default:””|

### Association
- belongs_to:tansaction
- belongs_to:user


# transactionテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null:false|
|buyer_id|integer|null:false|
|item_id|integer|null:false,foreign_key:true|

### Association
- has_many:transactions
- belongs_to:user
- belongs_to:item


# pictureテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null:false,default:””|
|status|integer|null:false,default:0|
|item_id|references|null:false,foreign_key:true|

### Association
- belongs_to:item


# brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|initial_word|string|null:false|

### Association
- has_many:items


# brand_groupテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references|null:false,foreign_key:true|
|group_id|references|null:false,foreign_key:true|

### Association
- has_many:items


# groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
- has_many:brand_groups
- has_and_belongs_to_many:brand


# upper_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
- has_many:items
- has_many:middle_categorys


# middle_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|upper_category_id|integer|null:false|
|size_type_id|references|foreign_key:true|

### Association
- has_many:items
- belongs_to:upper_category
- has_many:lower_categorys


# lower_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|middle_category_id|integer|null:false|

### Association
- belongs_to:middle_category
- has_many:items


# sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|size_type_id|integer|null:false,foreign_key:true|

### Association
- has_many:items
- belongs_to:size_type


# size_typyeテーブル
|Column|Type|Options|
|------|----|-------|
|size_type|string|null:false|

### Association
- has_many:sizes
- has_many:middle_categorys
