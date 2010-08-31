# The ruby version of the CSS Browser Selector with some additions
def detect_browser_os(user_agent = request.user_agent)
  [detect_browser(user_agent), detect_os(user_agent)].compact.join(' ')
end

def detect_os(user_agent = request.user_agent)
  ua = (user_agent || "").downcase

  ua.include?('mac') || ua.include?('darwin') ? ua.include?('iphone') ? 'iphone' : ua.include?('ipod') ? 'ipod' : 'mac' :
  ua.include?('x11') || ua.include?('linux') ? 'linux' :
  ua.include?('win') ? 'win' : nil
end
def detect_browser(user_agent = request.user_agent)
  ua = (user_agent || "").downcase
  case ua
    when /opera[\/,\s+](\d+)/
      o = %W(opera opera#{$1})
      o << "mobile" if ua.include?('mini')
      o.join(" ")
    when /webtv/ ;              "gecko"
    when /msie (\d)/ ;          "ie ie#{$1}"
    when %r{firefox/2} ;        "gecko ff2"
    when %r{firefox/3.5} ;      "gecko ff3 ff3_5"
    when %r{firefox/3} ;        "gecko ff3"
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
  end
end