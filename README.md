# Stockss

## Categories テーブル

|column|type|options|
|------|----|-------|
|category|string|null :false|

### Association
- has_many :items
- benogs_to :brand

## Brands テーブル

|column|type|options|
|------|----|-------|
|brand|string|null :false|

- has_many :items
- has_many :categories

## kinds テーブル

|column|type|options|
|------|----|-------|
|name|string||
|body|text||

### Association
- has_many :colors
- belongs_to :item
- belongs_to :category
- belongs_to :brand

## colors テーブル

|column|type|options|
|------|----|-------|
|color|string||

### Association
- belongs_to :kinds
- has_many :sizes
-has_many :images
- belongs_to :item

## sizes テーブル

|column|type|options|
|------|----|-------|
|size|integer||

### Association

- belongs_to :colors
- belongs_to :items

## imgages テーブル

|column|type|options|
|------|----|-------|
|image|string||

### Assosiation
- belongs_to :colors
- belongs_to :items

## items テーブル


|column|type|options|
|------|----|-------|
|stock|integer||
|retail_price|integer||
|kind_id|integer||
|color_id|integer||
|size_id|integer||
|image_id|integer||
|brand_id|integer||
|category_id|integer||

### Assoiciation

- has_many :kinds
- has_many :colors
- has_many :sizes
- has_many :images
- has_many :buy_price
- has_many :sell_price
- belongs_to :category
- belongs_to :brand

## buy_price テーブル

|column|type|options|
|------|----|-------|
|buy_price|integer||
|user_id|integer||

### Association

- belongs_to :item
- belongs_to :user

## sell_price テーブル

|column|type|options|
|------|----|-------|
|sell_price|integer||
|user_id|integer||


### Association

- belongs_to :item
- belongs_to :user

## sold_price テーブル
|column|type|options|
|------|----|-------|
|sold_price|integer||

### Association


## User テーブル

|column|type|options|
|------|----|-------|
|name|string||
|email|text||
|address|string||
|number|integer||

- has_many :buy_price
- has_many :sell_price
