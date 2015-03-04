# The ruby version of the CSS Browser Selector with some additions
def detect_browser_os(user_agent = request.user_agent)
  [detect_browser(user_agent), detect_os(user_agent)].compact.join(' ')
end

def detect_os(user_agent = request.user_agent)
  ua = (user_agent || "").downcase
  
  if ua.include?('iphone')
    'iphone'
  elsif ua.include?('ipad')
    'ipad'
  elsif ua.include?('ipod')
    'ipod'
  elsif ua.include?('mac') || ua.include?('darwin')
    'mac'
  elsif ua.include?('x11') || ua.include?('linux')
    'linux'
  elsif ua.include?('win')
    'win'
  else
    nil
  end
end

def detect_browser(user_agent = request.user_agent)
  ua = (user_agent || "").downcase
  case ua
    when /opera[\/,\s+](\d+)/
      o = %W(opera opera#{$1})
      o << "mobile" if ua.include?('mini')
      o.join(" ")
    when /webtv/ ;              "gecko"
    when /msie (\d+)/ ;         "ie ie#{$1}"
    when /trident/ ;            "gecko ie#{(ua.match(/rv:(\d+)/) || ['',''])[1]}"
    when %r{firefox/3.5} ;      "gecko ff3 ff3_5"
    when %r{firefox} ;          "gecko ff#{(ua.match(/firefox\/(\d+)/) || ['',''])[1]}"
    when /konqueror/ ;          "konqueror"
    when /applewebkit\/([\d.]+).? \([^)]*\) ?(?:version\/(\d+))?.*$/
      o = %W(webkit)
      if ua.include?('iron')
        o << 'iron'
      elsif ua.include?('chrome')
        o << 'chrome'
      else
        o << "safari safari"+ ($2 || (($1.to_i >= 400) ? '2' : '1'))
      end
      o.join(" ")
    when /gecko/, /mozilla/ ;   "gecko"
    else ""
  end
end