# DB設計

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false,unique:ture|
|uid|string|null:false,default:""|
|provider|string|null:false,default:""|
|good_count|integer|null:false, default: 0|
|normal_count|integer|null:false, default: 0|
|bad_count|integer|null:false, default: 0|

### Association
- has_one : phone_number
- has_many : adresses
- has_many : banks
- has_one : avatar
- has_many : reports
- has_many : likes
- has_many : comments
- has_many : transaction_messages
- has_many : items
- has_many : todos
- has_many : informations
- has_many : user_informations
- has_one : walet
- has_many : reviews

- has_many :appraiser, class_name: 'Evaluation', foreign_key: 'appraiser_id'
- has_many :appraisee, class_name: 'Evaluation', foreign_key: 'appraisee_id'


# phone_numberテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null:false,unique:true|
|user_id|integer|null:false,foreign_key:true|

### Association
- belongs_to : user

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

### Association
- belonsgs_to:adress


# avatarテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null:false|
|user_id|integer|null:false,foreign_key:true|

### Association
- belongs_to:user


# reportテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|item_id|integer|null:false,foreign_key:true|

### Association
- belongs_to : user
- belongs_to : item


# likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|item_id|integer|null:false,foreign_key:true|

### Association
- belongs_to : user
- belongs_to : item,counter_cache:like_count


# commentテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|item_id|integer|null:false,foreign_key:true|
|text|text|null:false|

### Association
- belongs_to : user
- belongs_to : item

# reviewテーブル
|Column|Type|Options|
|------|----|-------|
|appraiser_id|integer|null:false,foreign_key,index:true|
|appraisee_id|integer|null:false,foreign_key,index:true|
|item_id|integer|null:false,foreign_key: true|
|evaluation|integer|null:false, default: 0|
|text|text|null: false, default: “”|
- enum evaluation: { error: 0, good: 1, normal: 2, bad: 3 }

### Association
- belongs_to : user
- belongs_to : item


# walletテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|money|integer|null:false,default:0|
|point|integer|null:false,default:0|

### Association
- belongs_to:user
- has_many:withdraws


# withdrawalテーブル
|Column|Type|Options|
|------|----|-------|
|walet_id|integer|null:false,foreign_key:true|
|withdrawal_price|integer|null:false|

### Association
- belongs_to : wallet


# informationテーブル
|Column|Type|Options|
|------|----|-------|
|infomation_type|integer|null:false,default:0|
|item_id|integer|null:false,foreign_key:true|
|text|text|null:false,default:""|
|changed_price|integer|null:false,default:0|
|changed_stage|integer|null:false,default:0|

### Association
- belongs_to : user
- belongs_to : item
- has_many : user_informations


# user_infomationテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|infomation_id|integer|null:false,foreign_key:true|

### Association
- belongs_to : user_information
- belongs_to : user


# todoテーブル
|Column|Type|Options|
|------|----|-------|
|todo_type|integer|null:false|
|text|text|null:false|
|item_id|integer|null:false,foreign_key:true|
|user_id|integer|null:false,foreign_key:true|

### Association
- belongs_to:user
- belongs_to:item

# itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false, default: ""|
|description|text|null:false, default: ""|
|state|integer|null:false, default: 0|
|delivery_payer|integer|null:false, default: 0|
|delivery_region|integer|null:false, default: 0|
|delivery_duration|integer|null:false, default: 0|
|buy_price|integer|null:false, default: 0|
|sell_price|integer|null:false, default: 0|
|commition_price|integer|null:false, default: 0|
|transaction_stage|integer|null:false, default: 0|
|like_count|integer|null:false, default: 0|
|size_id|integer|null:false,foreign_key: true|
|brand_id|integer|null:false,foreign_key: true|
|upper_category_id|integer|null:false,foreign_key: true|
|middle_category_id|integer|null:false,foreign_key: true|
|lower_category_id|integer|null:false,foreign_key: true|
|seller_id|integer|null:false,add_foreign_key :items, :users, column: :seller_id,index:true|
|buyer_id|integer|null:false,add_foreign_key :items, :users, column: :buyer_id, index:true|

### Association
- belongs_to:user
- has_many:reports
- has_many:likes
- has_many:comments
- has_many:transactions
- has_many:pictures
- belongs_to:brand
- belongs_to:upper_categorys
- belongs_to:middle_categorys
- belongs_to:lower_categorys
- belongs_to:size
- has_many:todos
- has_many:informations
- has_many:reviews


# transaction_messageテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|item_id|integer|null:false,foreign_key:true|
|text|text|null:false,default:""|

### Association
- belongs_to:user
- belongs_to:item


# pictureテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null:false,default:””|
|status|integer|null:false,default:0|
|item_id|integer|null:false,foreign_key:true|

### Association
- belongs_to:item


# brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|initial_word|string|null:false|

### Association
- has_many:items
- has_many:groups,through: :brand_group


# brand_groupテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null:false,foreign_key:true|
|group_id|integer|null:false,foreign_key:true|

### Association
- belongs_to:brad
- belongs_to:group


# groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
- has_many:brand,through: :brand_groups


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
|size_type_id|integer|null:false,foreign_key:true|

### Association
- has_many:items
- belongs_to:upper_category
- has_many:lower_categorys
- belongs_to:size_type


# lower_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|middle_category_id|integer|null:false,foreign_key:true|

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
