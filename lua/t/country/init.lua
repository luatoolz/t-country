local t=t or require "t"
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
__index=function(self, k) return k and rawget((key[k] or type(k)=='number') and self or country, type(k)=='string' and normalize(k) or k) or nil end,
__iter=function(self) return table.iter(values) end,
__newindex=function(self, k, v)
  if self==country then
    if type(k)=='table' and type(getmetatable(k))=='nil' and v then
      if k.id and k.code and k.name then
        k.id=normalize(k.id)
        k.code=normalize(k.code)
        setmetatable(k, getmetatable(country))
        rawset(self, normalize(k.id), k)
        rawset(self, normalize(k.code), k)
        rawset(self, normalize(k.name), k)
        if type(k.alias)=='table' then
          for _,id in ipairs(k.alias) do
            id=normalize(id)
            if not rawget(self, id) then rawset(self, id, k)
              end end end end end end end,
__pairs=function(self)
  local inext, _, i, v = ipairs(values)
  return function(_, cur)
    repeat i,v = inext(values, i or 0)
    until type(i)=='number' or type(i)=='nil'
    if v then return v.id, v end
      end, self
end,
__tostring = function(self) return self==country and 'country' or self.id end,
}) .. values