local t=require "t"
local checker = t.checker
local country = {}
local normalize = function(x) return (type(x)=='string' and x~='') and string.lower(x) or nil end
local key = checker({id=true, code=true, name=true, alias=true}, normalize)
local values = t['country/data']
local is = t.is
local geoip = assert(t.maxmind)

return setmetatable(country, {
__call=function(self, k) if self==country and k then
  if is.ip(k) then return geoip and geoip(k) else return self[k] end
end end,
__concat=function(self, ct)
  if self==country and type(ct)=='table' and #ct>0 then
    for _,it in ipairs(ct) do self[it]=true end
  end
  return self
end,
__export=function(self) if self~=country then return tostring(self) end end,
__index=function(self, k)
  if type(k)=='number' then return rawget(self, k) end
  return k and rawget(key[k] and self or country, normalize(k))
end,
__iter=function(self) return table.iter(values) end,
__newindex=function(self, k, v)
  if self==country then
    if type(k)=='table' and type(getmetatable(k))=='nil' and v then
      if k.id and k.code and k.name then
        local i=#country+1
        k.id=normalize(k.id)
        k.code=normalize(k.code)
        rawset(k, 'i', i)
        setmetatable(k, getmetatable(country))
        rawset(self, normalize(k.id), k)
        rawset(self, normalize(k.code), k)
        rawset(self, normalize(k.name), k)
        rawset(country, i, k)
        if type(k.alias)=='table' then
          for _,id in ipairs(k.alias) do
            id=normalize(id)
            if not rawget(self, id) then rawset(self, id, k)
              end end end end end end end,
__pairs=function(self)
  return function(arr, cur)
    local i=(((arr or {})[cur] or {}).i or 0)+1
    local v=country[i]
    if v then return v.id, v end
  end, self or {}
end,
__tostring = function(self) return self==country and 'country' or self.id end,
}) .. values