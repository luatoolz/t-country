# t.country: country
```lua
local t = require "t"
local country = t.country
```

Object format:
```lua
local us = {id='US', c3='USA', name='United States'}
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

## caveats
- added alias `country.gb == country.uk`
- europe `country.eu` exists
