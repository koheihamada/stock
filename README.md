# Stockss

## Categories テーブル

|column|type|options|
|------|----|-------|
|category|string|null: false|

### Association
- has_many :kinds

## Brands テーブル

|column|type|options|
|------|----|-------|
|brand|string|null :false|

- has_many :kinds

## kinds テーブル

|column|type|options|
|------|----|-------|
|name|string||
|body|text||
|category_id|integer||
|brand|integer||

### Association
- has_many :colors
- has_many :item
- belongs_to :category
- belongs_to :brand

## colors テーブル

|column|type|options|
|------|----|-------|
|color|string||
|kind_id|integer||

### Association
- belongs_to :kind
- has_many :sizes
- has_many :images
- has_many :item

## sizes テーブル

|column|type|options|
|------|----|-------|
|size|integer||
|color_id :integer||

### Association

- belongs_to :color
- has_many :items

## imgages テーブル

|column|type|options|
|------|----|-------|
|image|string||
|color_id|integer||

### Assosiation
- belongs_to :colors

## items テーブル


|column|type|options|
|------|----|-------|
|stock|integer||
|retail_price|integer||
|kind_id|integer||
|color_id|integer||
|size_id|integer||



### Assoiciation

- belongs_to :kinds
- belongs_to :colors
- belongs_to :sizes
- has_many :buy_price
- has_many :sell_price
- has_many :sold_price

## buy_price テーブル

|column|type|options|
|------|----|-------|
|buy_price|integer||
|user_id|integer||
|item_id|integer||

### Association

- belongs_to :item
- belongs_to :user

## sell_price テーブル

|column|type|options|
|------|----|-------|
|sell_price|integer||
|user_id|integer||
|item_id|integer||


### Association

- belongs_to :item
- belongs_to :user

## sold_price テーブル
|column|type|options|
|------|----|-------|
|sold_price|integer||
|item_id|integer||

### Association

- belongs_to :item

## User テーブル

|column|type|options|
|------|----|-------|
|name|string||
|email|text||
|address|string||
|number|integer||

- has_many :buy_price
- has_many :sell_price
