# t.country: country
```lua
local t = require "t"
local country = t.country
```

Object format:
```lua
local us = {id='us', code='usa', name='United States'}
```

To get object:
```lua
print(country.us)
print(country.US)
print(country['usa'])
print(country.USA)
print(country['United States'])
print(country['UNITED STATES'])
```

To get geoip:
```lua
print(country('8.8.8.8'))
```

## caveats
- added alias `country.gb == country.uk`
- virtual europe `country.eu` exists

## depends
Please refer to Dockerfile