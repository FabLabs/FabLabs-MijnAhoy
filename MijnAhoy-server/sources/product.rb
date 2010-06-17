require 'json'
require 'open-uri'

class Product < SourceAdapter
  def query(conditions=nil,limit=nil,offset=nil)
    url="http://rhostore.heroku.com/products.json"
    if limit & offset
      url += "?limit=#{limit}&offset=#{offset}"
    end
    
    parsed=nil
    open(url) do |f|
      parsed=JSON.parse(f.read)
    end
    
    @result={}
    
    parsed.each { |item|@result[item["product"]["id"].to_s]=item["product"] } if parsed
    
    @result
  end
 
  def create(name_value_list)
    res = Net::HTTP.post_form(URI.parse("http://rhostore.heroku.com/products"),name_value_list)
    puts "res: #{res.inspect}"

    # after create we are redirected to the new record. We need to get the id of that record and return it as part of create
    # so rhosync can establish connection from its temporary object on the client to this newly created object on the server
    case res
      when Net::HTTPRedirection
        parsed = {}
        open(res['location']+".json") do |f|
          parsed=JSON.parse(f.read)
        end
        puts "parsed: #{parsed.inspect}"
        return parsed["product"]["id"].to_s rescue nil
    end
  end
 
  def update(name_value_list)
    obj_id = name_value_list['id']
    name_value_list.delete('id')
    uri = URI.parse('http://rhostore.heroku.com')
    Net::HTTP.start(uri.host) do |http|
      request = Net::HTTP::Put.new(uri.path + "/products/#{obj_id}.xml", {'Content-type' => 'application/xml'})
      request.body = xml_template(name_value_list)
      response = http.request(request)
    end
  end
 
  def delete(name_value_list)
    http=Net::HTTP.new('rhostore.heroku.com',80)
    path="/products/#{name_value_list['id']}"
    resp=http.delete(path)
  end
  
  protected
  # API is expecting us to send XML content
  def xml_template(params)
    xml_str = "<product>"
    params.each do |key,value|
      xml_str += "<#{key}>#{value}</#{key}>"
     end
     xml_str += "</product>"
     xml_str
   end
end