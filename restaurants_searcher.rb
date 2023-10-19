# restraurants_searcher.rb

require 'net/http'
require 'json'

#初期設定
KEYID = "6bd7fb4340b2f546"
CONUT = 100
PREF = "Z011"
FREEWORD = "渋谷駅"
FORMAT = "json"
PARAMS = {"key": KEYID, "count":CONUT, "large_area":PREF, "keyword":FREEWORD, "format":FORMAT}

def write_data_to_csv(params)
  restaurants = [["名称","営業日","住所","アクセス"]]
  uri = URI.parse("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/")
  uri.query = URI.encode_www_form(params)
  json_res = Net::HTTP.get uri

  response = JSON.load(json_res)

  if response == nil or response["results"].has_key?("error") then
    puts "エラーが発生しました!"
    return
  end
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