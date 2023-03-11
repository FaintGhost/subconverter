{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
redir-port: {{ default(global.clash.redir_port, "7892") }}
mixed-port: {{ default(global.clash.mixed_port, "7893") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "warning") }}
external-controller: :9090
script:
  shortcuts:
    quic: network == 'udp' and dst_port == 443
{% if default(request.clash.dns, "") == "1" %}
dns:
  enabled: true
  listen: 1053
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5

[Script]
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js

{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,119.29.29.29,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]

[Remote Rule]

[URL Rewrite]
enable = true
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204
resource_parser_url=https://cdn.jsdelivr.net/gh/KOP-XIAO/QuantumultX@master/Scripts/resource-parser.js
profile_img_url=https://raw.githubusercontent.com/FaintGhost/files/main/img/cover.jpg
;ssid_suspended_list=Apple, Microsoft

[dns]
no-ipv6
server=119.29.29.29
server=223.5.5.5
server=223.6.6.6

[server_remote]

[policy]

dest-hash=🔰 所有节点, resource-tag-regex=^, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Available.png

url-latency-benchmark=香港节点优选, server-tag-regex=香港, check-interval=300, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Hong_Kong.png
url-latency-benchmark=新加坡节点优选, server-tag-regex=新加坡, check-interval=300, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Singapore.png
url-latency-benchmark=台湾节点优选, server-tag-regex=台湾, check-interval=300, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Taiwan.png
url-latency-benchmark=日本节点优选, server-tag-regex=日本, check-interval=300, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Japan.png
url-latency-benchmark=美国节点优选, server-tag-regex=美国, check-interval=300, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/United_States.png

url-latency-benchmark=♻️ 自动选择, resource-tag-regex=^, check-interval=300, tolerance=100, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Auto.png

static=🚀 节点选择, ♻️ 自动选择, 🔰 所有节点, direct, 香港节点优选, 新加坡节点优选, 台湾节点优选, 日本节点优选, 美国节点优选, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Nfcloud.png

static=📲 电报信息, 🚀 节点选择, 香港节点优选, 新加坡节点优选, 台湾节点优选, 日本节点优选, 美国节点优选, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Telegram.png

static=Ⓜ️ 微软服务, 🚀 节点选择, 🎯 全球直连, 香港节点优选, 新加坡节点优选, 台湾节点优选, 日本节点优选, 美国节点优选, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Microsoft.png

static=🍎 苹果服务, 🚀 节点选择, 🎯 全球直连, 香港节点优选, 新加坡节点优选, 台湾节点优选, 日本节点优选, 美国节点优选, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Apple.png

static=📢 谷歌FCM, 🚀 节点选择, 🎯 全球直连, 香港节点优选, 新加坡节点优选, 台湾节点优选, 日本节点优选, 美国节点优选, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Google_Search.png

static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Global.png

static=🛑 全球拦截, reject, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Reject.png

static=🍃 应用净化, reject, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Advertising.png

static=🎮 台服游戏, 香港节点优选, 台湾节点优选, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Game.png

static=🎮 日服游戏, 日本节点优选, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Game.png

static=❤️ 个人列表, direct, 🚀 节点选择, 香港节点优选, 新加坡节点优选, 台湾节点优选, 日本节点优选, 美国节点优选, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Heart.png

static=🐟 漏网之鱼, 🚀 节点选择, 🎯 全球直连, 香港节点优选, 新加坡节点优选, 台湾节点优选, 日本节点优选, 美国节点优选, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Bypass.png

[filter_remote]
https://cdn.jsdelivr.net/gh/FaintGhost/ACL4SSR@master/gamestw-qx.txt, tag=🎮 台服游戏, enabled=true
https://cdn.jsdelivr.net/gh/FaintGhost/ACL4SSR@master/gamesjp-qx.txt, tag=🎮 日服游戏, enabled=true
https://cdn.jsdelivr.net/gh/FaintGhost/ACL4SSR@master/personal-qx.txt, tag=❤️ 个人列表, enabled=true
https://subcon.dlj.tf/getruleset?type=2&url=aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FDTDRTU1IvQUNMNFNTUi9tYXN0ZXIvQ2xhc2gvQmFuQUQubGlzdA&group=8J-bkSDlhajnkIPmi6bmiKo, tag=🛑 全球拦截, enabled=true
https://subcon.dlj.tf/getruleset?type=2&url=aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FDTDRTU1IvQUNMNFNTUi9tYXN0ZXIvQ2xhc2gvQmFuUHJvZ3JhbUFELmxpc3Q&group=8J-NgyDlupTnlKjlh4DljJY, tag=🍃 应用净化, enabled=true
https://subcon.dlj.tf/getruleset?type=2&url=aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FDTDRTU1IvQUNMNFNTUi9tYXN0ZXIvQ2xhc2gvUnVsZXNldC9Hb29nbGVGQ00ubGlzdA&group=8J-ToiDosLfmrYxGQ00, tag=📢 谷歌FCM, enabled=true
https://subcon.dlj.tf/getruleset?type=2&url=aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FDTDRTU1IvQUNMNFNTUi9tYXN0ZXIvQ2xhc2gvTWljcm9zb2Z0Lmxpc3Q&group=4pOC77iPIOW-rui9r-acjeWKoQ, tag=Ⓜ️ 微软服务, enabled=true
https://subcon.dlj.tf/getruleset?type=2&url=aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FDTDRTU1IvQUNMNFNTUi9tYXN0ZXIvQ2xhc2gvQXBwbGUubGlzdA&group=8J-NjiDoi7nmnpzmnI3liqE, tag=🍎 苹果服务, enabled=true
https://subcon.dlj.tf/getruleset?type=2&url=aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FDTDRTU1IvQUNMNFNTUi9tYXN0ZXIvQ2xhc2gvVGVsZWdyYW0ubGlzdA&group=8J-TsiDnlLXmiqXkv6Hmga8, tag=📲 电报信息, enabled=true
;https://subcon.dlj.tf/getruleset?type=2&url=aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FDTDRTU1IvQUNMNFNTUi9tYXN0ZXIvQ2xhc2gvUHJveHlMaXRlLmxpc3Q&group=8J-agCDoioLngrnpgInmi6k, tag=🚀 节点选择, enabled=true
https://subcon.dlj.tf/getruleset?type=2&url=aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FDTDRTU1IvQUNMNFNTUi9tYXN0ZXIvQ2xhc2gvQ2hpbmFEb21haW4ubGlzdA&group=8J-OryDlhajnkIPnm7Tov54, tag=🎯 全球直连, enabled=true

[rewrite_remote]
https://raw.githubusercontent.com/zZPiglet/Task/master/UnblockURLinWeChat.conf, tag=weixin, update-interval=86400, opt-parser=true, enabled=true
https://cdn.jsdelivr.net/gh/NobyDa/Script@master/QuantumultX/Rewrite_lhie1.conf, tag=Ihie1, update-interval=86400, opt-parser=true, enabled=true

[server_local]

[filter_local]
GEOIP,CN,🎯 全球直连
FINAL,🐟 漏网之鱼

[rewrite_local]

[mitm]
hostname = *.googlevideo.com
passphrase = EE4E49A3
p12 = MIILuQIBAzCCC4MGCSqGSIb3DQEHAaCCC3QEggtwMIILbDCCBccGCSqGSIb3DQEHBqCCBbgwggW0AgEAMIIFrQYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQIFE1+K0QBBkMCAggAgIIFgEBy3qLrNS1WuYSWOpXLq2Dl0IuyT9ZonkFZkT7rmztC+CXcxZakF6NOpZvlmZT7EHPWX8TKjRA0Li/zZEwxEL9ALtX+oOY7pzIW6gg5S2PVKJNM8ROH98262uVIvqwUmn3KKQ/WUUJNTEiEbP21TDqCJCxsRtl9utJUP6hr0SwKsOiVfz3RC3OQ2L0gYcBdKP3jMhDMYp6mt6joTk3CsY30cHfuashWCLelGWIqLfdujpdS+s5/ev7TK1F0jk4Nwc6bY/GftQ9iikZGN256Ll5gHjqOMZC0ErlF/6M2FJQBvYNcP+tNU4X2xhHCERDecNu5R2BccGWEkq1UhFP+kVaWEt/OJNSOe9WEPJ7LLeaNNsiYcYco1w67TdNeS3f5dg4Jdte+kLGA0jgoVzsviazjRMJP9P237RWw+dPadHMlu4Escg5rUg9rlXvJRp+zssRkvuSgqqIkS/MA5fwMPBcwchJzULzDhuIlEnjFco3HUrNxMmww99hf0LDsWSU8wOcJOAgwGgf1BsfwNiA8rUZrucFyvni81hCyeLpi8aCcnqOsjrAXdJFh5EQWmHyeV4vqZ3kWHBX3F9TqFCL9He0JoWAHyf5XA4j9/XSiiLRjnyt8V5k/jGOvVvYnSTmogohh9Gfu5uHn3Fg5Jtxj1uPD2FhiUeXKSzsLXLrdKgj/7Fa8VV17nwM0pGhAhnc5aPgxrOGsX4tDONMilVh/Pnvgafp3wcSVk7bdBYdLd1D878iPytSzY7PIFsoZoBrJkiCp/B+gaMOkffmbkQLABfHMVIJIOzbMCS0VHnkFHdPaqOxUEzJChYVkXw/iU8A0RJX65Bmz6fzvOaRzRueJjP03bjtG8E4FsoSCiwu+Qk5/XilSdETA5T5aB/HF1jONB+X7znxyWSLgJyC6ow+RvLrW3u10SjgApBPTqqkb0gfBmTy1ImOBaX9yWvNPFjxdDnui9JFKdb5wfCsMHHYIlQTVMgodyAgVm624ukN7fxkSf2ioGWL9Ylw66fLQiis3/55jkDKnx9mFsMWlHPWpOi5/UPHadUiL1X30wxlFufFhYRGqMCv7gSfReUUjL0CZJ+1efawTOhg5Hn/zJnV80ilOzY7we39aVne3z/N5fIlUfc1RI8E7nTIHkd4Rc6q0uKYJ8acGQLwAcgcRghGbxVFdSdOKcHpBAMUIfi3qerkaQyzl3RQjD9kpQ5Cp1Tb5oKIft3Mlyeg6RbItm39MygAYvsogc1rmpjHLVZ7kAdzmp5TEAlIHrVuAeu7p8OJ3+s3PSZYSPijUu7wNKtfAbxoZ4TnBAACEaK+TUjJOxboiBJZRgne5oh3mq6JNNA0qOTPRYDZcQFYNPtgGvZDxqS3gv6Ucxtd760/lSFl/m+J1HPq0LgoLNqJHsv5xP2fBcFdFxPjNJcPPS+XPGjoRHpqE37ozWqAxe1H9RFXkesdZfw4QmuVBHnzPS3u0XDLfAGGPGSZy36FBwtP6OgdKvw+kst7SYcas1jFZnRcF8ovyLcn57AHry5sJFvyYz3tN0NOKmrQ5cfehxv+kKcC1RldxG7rT5tvJFpwR7Aa7TmJFvIxOYn6l0+G/b9VpWQYiWBcXAIVaczoqIk/H5wdWnD1ywFDdgvH3PKJ1K2yoO35jQM9RZPmpQ+RaeX+4xsQZ9IEh6EA5T3PL6FTQGekhahMIQ/0LQ5Yav3a5Lv7cYREB0EKrC0Uqgyc2/dKQKqbwmyiCNt4X3vDu067shxcIkTQtVwCY534dCLWE9Yn7+tEHwVFETNaeVjGChbpaCByOBRFZDFGpUFwdP/UcCQ9WG87wlAAsd6p4p78bXslf6VPTWiKGT2MqnDxh658bKENccZDEyt1SaLbMmnXteT06jNYwggWdBgkqhkiG9w0BBwGgggWOBIIFijCCBYYwggWCBgsqhkiG9w0BDAoBAqCCBO4wggTqMBwGCiqGSIb3DQEMAQMwDgQI+18q6bDzKEECAggABIIEyDOkVKb2N4j5XFjR/6j4uTNsOmJsYaF4C2GZgULPbUimJJRaAMKNFuwxMQElOtEv4+h0Ul5e0BZ+xCs0BcWfatyQVK0h6yBR5rTytjdkR4Tpg5/tOHDApbX5ktPCMJSp2W6fGyDqWccYxRrmUJdbB3t0ZKb+nou6JyeZ0cWBzfhqZW24IL/BADAbWAuPtNKORr89Ns8pMOU/v/XIN5mAaBQJDNICj0+IoR6rCTxFp4vHyuLbxHhQoPck2GvBFiXkQhU17uPXMaw9d/jDkkkv0t7vis//QeJs3O420fAFSHkggfDHrIPHx4Xaf44qYIghvI5yZM46fm85xXKe2qSNqEx31inOnr48cH+wJafV7sqRZLFei6Ohb8ylSQ9i7VTFmcjSURuV9MkL+N1dGa3HbLFSWmXAvEvXKSlDJxjfxYb5F1gtUoxDh1jyQZnurnQzB3/6V42dCI+rTj/QgHNsOgM3PDwDJv3vXtl6G0pvaNZODsvN3HnLVyB5qyz495DZxpoePeZbGTnGtnFYeat7Ls1D4mnAKcthP9ZI5A9CDUyIcKf2YCrJczzQr7xRfdEkrwukKOfuq744g6YNe/XxGBzfW5xBOVIHwawqGEdWi0IYhnI2TJ3CEon6z4hIIuG6Cg8BMKSSl6TsLZBpW2BGN0un8jAniUhT9MelxTRIyeAJV50Q8sm0w0MaeGYZl91tbh+6Da/X7/zg6GTCb7WM/eQwDEATPCJ+mNUHxzUR5RpExvPVZv7dA++QU9kAQ2bAsMYMzmgbMRdbapOg1DU4c63zdJy2C+0c9l6bnaq5iF4AwIOAhT4aauV2IL79ghUZ3u4kggVphE/U3oiFP3lUdiL589hEnrzYOTf4ZVU4UJOqXkFzdf1wKdI9pKOGpKm5Ri51/cJjEEB4HXD610Rvj7X3Zk494CZLzRLzN920/a30NS3eM4ycjw7p1eUDc/FFKwitFnel4W1+mmWuULX0uwmO5oMrj4GwZdNQY7ePjPtOYFDgNFGUtAhchGwCaPIbwbq6bQq0Z4ccgJuvL4lpuJ3+tFDV/tVy9BCcJY207Lp6kXKr4qzhvu6Tn9q9CzmBDo3b5k9izxqm9A6HlPE3A3kTptOiAMignp3GEii8YHKulfdPuXZVxhEtvzAKpJOs0vm+78yF+hWnreB2gZ3vXgfDvYJj4y9PvFQ85jft/CLyqLPvZAl+/shjadJ14hChDLHqknituCIbqUHS3CHMi54jFCwlmPsR2Reem9LTSLZK0RBItx9pwSSNgn2PioEtQUvNTxCbgHWC+lEdd5Iw+qkC12oroK2Gxs1OaEosdQvxE3RH5Ikx0kyWI5ig+uTUdwDgmSYFNuaoU4dLtp/BsjExhVYXMTYUWml7/soeBMtqryDXsX1xhd1EEnmlFzmjN00Eulcp8TOFVrttwxaeEg0MRHH/+YcuFoPZiCsx1WBXcQK9Vs/o5Co8/IZLj6MA3M5XTxqhtBy1OR6RVXxGcIzKP9J0ctAHQEO8/JLId5vDH7sjEzv/cvy6yUOS3LOzzgHqXmjVwye7iaroTX1S3q/vEbJ6sqIhS93g9YMyTK7KJniIvbJdqVDAlQLkDcSdBJO+e1Vhwsh1DCtdKe3T1oLcvS3c6S9dnzGBgDAjBgkqhkiG9w0BCRUxFgQUCqa7sMxjaPaxtawTle6qUsQH+hUwWQYJKoZIhvcNAQkUMUweSgBRAHUAYQBuAHQAdQBtAHUAbAB0ACAAWAAgAEMAQQAgADYARAA3ADEANAAxADgAMAAgACgAMwAgAFMAZQBwACAAMgAwADIAMQApMC0wITAJBgUrDgMCGgUABBT7yMNkK1uCrLbHUtvVwNmqHRy/dwQIqwSg67xlHms=

[task_local]
1 0 * * * https://raw.githubusercontent.com/chavyleung/scripts/master/10000/10000.js, tag=中国电信, img-url=https://raw.githubusercontent.com/Orz-3/task/master/10000.png, enabled=true


[http_backend]
https://raw.githubusercontent.com/chavyleung/scripts/master/chavy.box.js, tag=boxjs, path=^/, enabled=true


{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}
