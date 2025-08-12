local t = require 't'
local pkg, is = 't/maxmind', t.is
local call = t.call
local city = "/usr/share/GeoIP/GeoLite2-City.mmdb"
pkg:assert(is.fs.file(city), 'GeoDB not found', city)
local mm = assert(require "maxminddb")
local db = assert(mm.open(city))
local tuple = t.tuple

local ip = t.net.ip
local dns = t.net.dns
local normalize = function(x) return (type(x)=='string' and x~='') and string.lower(x) or nil end

local lookup = function(...) return call.quiet(function(it) return it and tuple.v(db:lookup(tostring(it)):get("country", "iso_code")) end,...) end
return function(it)
  if is.net.ip(it) then return normalize(lookup(ip(it))) end
  if is.array(it) then error('ARRAY') end
  if is.net.host(it) then
    it=dns.a(it)
    if it then
      local rv
      for _,v in ipairs(it) do
        rv=normalize(lookup(ip(v)))
        if type(rv)~='nil' then return rv end
      end
    end
  end
end