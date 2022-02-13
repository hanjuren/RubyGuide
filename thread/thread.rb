require 'net/http'

pages = %w(www.naver.com www.google.com www.youtube.com)

threads = pages.map do |page|
  Thread.new(page) do |url|
    http = Net::HTTP.new(url, 80)
    pp "Fetching: #{url}\n"
    res = http.get('/')
    pp "Got #{url}: #{res.message}"
  end
end
threads.each do |thr|
  thr.join
end

pp threads