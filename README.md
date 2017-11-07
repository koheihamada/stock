## kinds テーブル

|column|type|options|
|------|----|-------|
|category|string||
|brand|string||
|name|string||
|body|text||

### Association
- has_many :colors
- belongs_to :item

##colors テーブル

|column|type|options|
|------|----|-------|
|color|string||

### Association
- belongs_to :kinds
- has_many :sizes
-has_many :images
- belongs_to :item

##sizes テーブル

|column|type|options|
|------|----|-------|
|size|integer||

###Association

- belongs_to :colors
- belongs_to :items

##imgages テーブル

|column|type|options|
|------|----|-------|
|image|string||

###Assosiation
- belongs_to :colors
- belongs_to :items

##items テーブル
  

|column|type|options|
|------|----|-------|
|
|
|
