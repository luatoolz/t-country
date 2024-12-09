local t = require "t"
local pkg, is = ..., t.is
local city = "/usr/share/GeoIP/GeoLite2-City.mmdb"
pkg:assert(is.file(city), 'GeoDB not found', city)
local mm = assert(require "maxminddb")
local db = assert(mm.open(city))

local ip = t.net.ip
local normalize = function(x) return (type(x)=='string' and x~='') and string.lower(x) or nil end
local lookup = t.caller(function(it) return it and db:lookup(tostring(it)):get("country", "iso_code") end)
return function(it) return normalize(lookup(ip(it))) end