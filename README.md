# Django-ToDo-App-with-PostgreSQL

How to build Django To-Do app with PostgreSQL

Content Discussed :
- Get started with Django Framework
- How to work with Database in Django
- Routing in Django
- CRUD Operations using Django ORM

## 程式碼參考教學來源
 :tv: Video tutorial on this same topic  
 Url : https://youtu.be/Nnoxz9JGdLU
 ```
$ git clone https://github.com/CodAffection/Django-ToDo-App-with-PostgreSQL.git
```
<a href="http://www.youtube.com/watch?feature=player_embedded&v=Nnoxz9JGdLU
" target="_blank"><img src="http://img.youtube.com/vi/Nnoxz9JGdLU/0.jpg" 
alt="Video Tutorial for Django To-Do App with PostgreSQL" width="500" height="400" border="10" /></a>

## 開發者注意事項
:warning: 若專案建立後程式碼Pull到local端下來無法執行, 此狀況為正常現象
* 要在local端測試部屬提供兩種方式，透過安裝docker來進行專案快速專案部屬或直接本地端執行

## (local)本地環境隔離快速專案部屬(隨機PORT)
需安裝Docker, 若在Linux環境需額外手動安裝docker-compose, 部屬結果與UI相同
``` 
docker-compose up -d --build 
```
部屬包含django網頁+Sqlite, 驗證後即可上傳程式碼

## 修改程式碼注意事項
1. 修改語言版本
而語言版本若非python3.7, 想要更換語言版本請至`Dockefile`修改為自己想要的版本(如需要本機上做測試則須一併連同`Dockerfile.local`去做修改)
2. 部屬環境額外環境變數
若開發需求上可能有針對專案需要的特別環境變數，由於目前此需求不再系統開發考慮範圍內，因此可能要麻煩使用者透過修改`Dockerfile`的形式去加入
```dockerfile
ENV 環境變數名稱1 值1
ENV 環境變數名稱2 值2
ENV 環境變數名稱3 值3
```
3. 若相關python套件需要額外系統套件(apt、yum、apk等)
若專案開發需求上可能有針對專案需要的系統套件的話，由於目前此需求不在系統開發考慮範圍內，因此可能要麻煩使用者透過修改`Dockerfile`的形式去加入
```dockerfile

```

