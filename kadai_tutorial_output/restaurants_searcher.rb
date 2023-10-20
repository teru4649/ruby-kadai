# restraurants_searcher.rb

require 'net/http'
require 'json'

#初期設定
# ⇩APIキーを発行して、発行されたAPIキーを持っている人のみAPIを使用出来る様にする場合がある。
KEYID = "6bd7fb4340b2f546"
CONUT = 100
# ⇩都道府県、恐らくホットペッパーにて設定しているキー
PREF = "Z011"
# ⇩おそらくあいまい検索
FREEWORD = "渋谷駅"
# ⇩API接続する場合の基本的なフォーマット。人が見やすく、軽い特徴がある。
FORMAT = "json"
PARAMS = {"key": KEYID, "count":CONUT, "large_area":PREF, "keyword":FREEWORD, "format":FORMAT}

def write_data_to_csv(params)
  restaurants = [["名称","営業日","住所","アクセス"]]
  # ⇩APIはURL単位で解放。URLにアクセスするとAPIに接続が可能になる。
  uri = URI.parse("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/")
  # ⇩検索条件を付ける。 エンコードについては、色々な書き方がある。
  uri.query = URI.encode_www_form(params)
  # ⇩Getメソッドで取得、結果を格納
  json_res = Net::HTTP.get uri
  # ⇩データとして扱いにくい状態(json_res)なので、加工して結果を格納
  response = JSON.load(json_res)

  # ⇩エラー対応　①レスポンスが空　②レスポンスの中にエラーが含まれる場合
  if response == nil or response["results"].has_key?("error") then
    puts "エラーが発生しました!"
    return
  end
  # ⇩エラー以外の場合の処理、responseの中身
  puts response

  # ⇩responseの中のresultsの中のshopというキーの中身をCount分取得
  for restaurant in response["results"]["shop"] do

    # ⇩飲食店の各種情報の見出しに当たる部分を設定
    rest_info = [restaurant["name"], restaurant["open"], restaurant["address"], restaurant["access"]]
    puts rest_info
    restaurants.append(rest_info)
    # ⇩初期設定
    # rest_name = restaurant["name"]
    # restaurants.append(rest_name)
  end

    # ⇩CSVクラスによるエラーが出力される
    File.open("restaurants_list.csv", "w") do |csv|
      restaurants.each do |rest_info|
          csv << rest_info
      end
    end

  # ⇩初期設定
  # File.open("restaurants_list.csv","w") do |file|
  #   file << restaurants
  # end
  return print restaurants
end 
write_data_to_csv(PARAMS)
