local t=t or require "t"
local checker = t.checker
local country = {}
local normalize = function(x) return (type(x)=='string' and x~='') and string.lower(x) or nil end
local key = checker({id=true, code=true, name=true, alias=true}, normalize)
local values
local is = t.is
--local ip = t.net.ip
local geoip = assert(require "t.maxmind")

return setmetatable(country, {
__call=function(self, k) if self==country and k then
  if is.ip(k) then return geoip and geoip(k) else return self[k] end
end end,
__concat=function(self, ct)
if self==country and type(ct)=='table' and #ct>0 then
  values=values or ct
  for _,it in ipairs(ct) do self[it]=true end
end; return self end,
__export=function(self) if self~=country then return tostring(self) end end,
__index=function(self, k) return k and rawget(key[k] and self or country, normalize(k)) end,
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
    repeat i,v = inext(values, i)
    until type(i)=='number' or type(i)=='nil'
    if i then return v.id,v end
      end, self end,
__tostring = function(self) return self==country and 'country' or self.id end,
}) .. {
{id="AD", code="AND", name="Andorra"},
{id="AE", code="ARE", name="United Arab Emirates"},
{id="AF", code="AFG", name="Afghanistan"},
{id="AG", code="ATG", name="Antigua and Barbuda"},
{id="AI", code="AIA", name="Anguilla"},
{id="AL", code="ALB", name="Albania"},
{id="AM", code="ARM", name="Armenia"},
{id="AN", code="ANT", name="Netherlands Antilles"},
{id="AO", code="AGO", name="Angola"},
{id="AQ", code="ATA", name="Antarctica"},
{id="AR", code="ARG", name="Argentina"},
{id="AS", code="ASM", name="American Samoa"},
{id="AT", code="AUT", name="Austria"},
{id="AU", code="AUS", name="Australia"},
{id="AW", code="ABW", name="Aruba"},
{id="AX", code="ALA", name="Aland Islands"},
{id="AZ", code="AZE", name="Azerbaijan"},
{id="BA", code="BIH", name="Bosnia and Herzegovina"},
{id="BB", code="BRB", name="Barbados"},
{id="BD", code="BGD", name="Bangladesh"},
{id="BE", code="BEL", name="Belgium"},
{id="BF", code="BFA", name="Burkina Faso"},
{id="BG", code="BGR", name="Bulgaria"},
{id="BH", code="BHR", name="Bahrain"},
{id="BI", code="BDI", name="Burundi"},
{id="BJ", code="BEN", name="Benin"},
{id="BL", code="BLM", name="Saint Barthelemy"},
{id="BM", code="BMU", name="Bermuda"},
{id="BN", code="BRN", name="Brunei"},
{id="BO", code="BOL", name="Bolivia"},
{id="BR", code="BRA", name="Brazil"},
{id="BS", code="BHS", name="Bahamas"},
{id="BT", code="BTN", name="Bhutan"},
{id="BV", code="BVT", name="Bouvet Island"},
{id="BW", code="BWA", name="Botswana"},
{id="BY", code="BLR", name="Belarus"},
{id="BZ", code="BLZ", name="Belize"},
{id="CA", code="CAN", name="Canada"},
{id="CC", code="CCK", name="Cocos (Keeling} Islands"},
{id="CD", code="COD", name="Congo Democratic Republic"},
{id="CF", code="CAF", name="Central African Republic"},
{id="CG", code="COG", name="Congo"},
{id="CH", code="CHE", name="Switzerland"},
{id="CI", code="CIV", name="Cote D’Ivoire"},
{id="CK", code="COK", name="Cook Islands"},
{id="CL", code="CHL", name="Chile"},
{id="CM", code="CMR", name="Cameroon"},
{id="CN", code="CHN", name="China"},
{id="CO", code="COL", name="Colombia"},
{id="CP", code="CPI", name="Clipperton Island"},
{id="CR", code="CRI", name="Costa Rica"},
{id="CU", code="CUB", name="Cuba"},
{id="CV", code="CPV", name="Cape Verde"},
{id="CX", code="CXR", name="Christmas Island"},
{id="CY", code="CYP", name="Cyprus"},
{id="CZ", code="CZE", name="Czech Republic"},
{id="DE", code="DEU", name="Germany"},
{id="DJ", code="DJI", name="Djibouti"},
{id="DK", code="DNK", name="Denmark"},
{id="DM", code="DMA", name="Dominica"},
{id="DO", code="DOM", name="Dominican Republic"},
{id="DZ", code="DZA", name="Algeria"},
{id="EC", code="ECU", name="Ecuador"},
{id="EE", code="EST", name="Estonia"},
{id="EG", code="EGY", name="Egypt"},
{id="EH", code="ESH", name="Western Sahara"},
{id="ER", code="ERI", name="Eritrea"},
{id="ES", code="ESP", name="Spain"},
{id="ET", code="ETH", name="Ethiopia"},
{id="FI", code="FIN", name="Finland"},
{id="FJ", code="FJI", name="Fiji"},
{id="FK", code="FLK", name="Falkland Islands"},
{id="FM", code="FSM", name="Micronesia"},
{id="FO", code="FRO", name="Faroe Islands"},
{id="FR", code="FRA", name="France"},
{id="GA", code="GAB", name="Gabon"},
{id="UK", code="GBR", name="United Kingdom", alias={'gb'}},
{id="GD", code="GRD", name="Grenada"},
{id="GE", code="GEO", name="Georgia"},
{id="GF", code="GUF", name="French Guiana"},
{id="GG", code="GGY", name="Guernsey"},
{id="GH", code="GHA", name="Ghana"},
{id="GI", code="GIB", name="Gibraltar"},
{id="GL", code="GRL", name="Greenland"},
{id="GM", code="GMB", name="Gambia"},
{id="GN", code="GIN", name="Guinea"},
{id="GP", code="GLP", name="Guadeloupe"},
{id="GQ", code="GNQ", name="Equatorial Guinea"},
{id="GR", code="GRC", name="Greece"},
{id="GS", code="SGS", name="South Georgia and the South Sandwich Islands"},
{id="GT", code="GTM", name="Guatemala"},
{id="GU", code="GUM", name="Guam"},
{id="GW", code="GNB", name="Guinea-bissau"},
{id="GY", code="GUY", name="Guyana"},
{id="HK", code="HKG", name="Hong Kong"},
{id="HM", code="HMD", name="Heard Island and Mcdonald Islands"},
{id="HN", code="HND", name="Honduras"},
{id="HR", code="HRV", name="Croatia"},
{id="HT", code="HTI", name="Haiti"},
{id="HU", code="HUN", name="Hungary"},
{id="ID", code="IDN", name="Indonesia"},
{id="IE", code="IRL", name="Ireland"},
{id="IL", code="ISR", name="Israel"},
{id="IM", code="IMN", name="Isle of Man"},
{id="IN", code="IND", name="India"},
{id="IO", code="IOT", name="British Indian Ocean Territory"},
{id="IQ", code="IRQ", name="Iraq"},
{id="IR", code="IRN", name="Iran"},
{id="IS", code="ISL", name="Iceland"},
{id="IT", code="ITA", name="Italy"},
{id="JE", code="JEY", name="Jersey"},
{id="JM", code="JAM", name="Jamaica"},
{id="JO", code="JOR", name="Jordan"},
{id="JP", code="JPN", name="Japan"},
{id="KE", code="KEN", name="Kenya"},
{id="KG", code="KGZ", name="Kyrgyzstan"},
{id="KH", code="KHM", name="Cambodia"},
{id="KI", code="KIR", name="Kiribati"},
{id="KM", code="COM", name="Comoros"},
{id="KN", code="KNA", name="Saint Kitts and Nevis"},
{id="KP", code="PRK", name="North Korea"},
{id="KR", code="KOR", name="South Korea"},
{id="KW", code="KWT", name="Kuwait"},
{id="KY", code="CYM", name="Cayman Islands"},
{id="KZ", code="KAZ", name="Kazakhstan"},
{id="LA", code="LAO", name="Laos"},
{id="LB", code="LBN", name="Lebanon"},
{id="LC", code="LCA", name="Saint Lucia"},
{id="LI", code="LIE", name="Liechtenstein"},
{id="LK", code="LKA", name="Sri Lanka"},
{id="LR", code="LBR", name="Liberia"},
{id="LS", code="LSO", name="Lesotho"},
{id="LT", code="LTU", name="Lithuania"},
{id="LU", code="LUX", name="Luxembourg"},
{id="LV", code="LVA", name="Latvia"},
{id="LY", code="LBY", name="Libya"},
{id="MA", code="MAR", name="Morocco"},
{id="MC", code="MCO", name="Monaco"},
{id="MD", code="MDA", name="Moldova"},
{id="ME", code="MNE", name="Montenegro"},
{id="MF", code="MAF", name="Saint Martin"},
{id="MG", code="MDG", name="Madagascar"},
{id="MH", code="MHL", name="Marshall Islands"},
{id="MK", code="MKD", name="Macedonia"},
{id="ML", code="MLI", name="Mali"},
{id="MM", code="MMR", name="Burma"},
{id="MN", code="MNG", name="Mongolia"},
{id="MO", code="MAC", name="Macau"},
{id="MP", code="MNP", name="Northern Mariana Islands"},
{id="MQ", code="MTQ", name="Martinique"},
{id="MR", code="MRT", name="Mauritania"},
{id="MS", code="MSR", name="Montserrat"},
{id="MT", code="MLT", name="Malta"},
{id="MU", code="MUS", name="Mauritius"},
{id="MV", code="MDV", name="Maldives"},
{id="MW", code="MWI", name="Malawi"},
{id="MX", code="MEX", name="Mexico"},
{id="MY", code="MYS", name="Malaysia"},
{id="MZ", code="MOZ", name="Mozambique"},
{id="NA", code="NAM", name="Namibia"},
{id="NC", code="NCL", name="New Caledonia"},
{id="NE", code="NER", name="Niger"},
{id="NF", code="NFK", name="Norfolk Island"},
{id="NG", code="NGA", name="Nigeria"},
{id="NI", code="NIC", name="Nicaragua"},
{id="NL", code="NLD", name="Netherlands"},
{id="NO", code="NOR", name="Norway"},
{id="NP", code="NPL", name="Nepal"},
{id="NR", code="NRU", name="Nauru"},
{id="NU", code="NIU", name="Niue"},
{id="NZ", code="NZL", name="New Zealand"},
{id="OM", code="OMN", name="Oman"},
{id="PA", code="PAN", name="Panama"},
{id="PE", code="PER", name="Peru"},
{id="PF", code="PYF", name="French Polynesia"},
{id="PG", code="PNG", name="Papua New Guinea"},
{id="PH", code="PHL", name="Philippines"},
{id="PK", code="PAK", name="Pakistan"},
{id="PL", code="POL", name="Poland"},
{id="PM", code="SPM", name="Saint Pierre and Miquelon"},
{id="PN", code="PCN", name="Pitcairn"},
{id="PR", code="PRI", name="Puerto Rico"},
{id="PS", code="PSE", name="Palestinian Territory"},
{id="PT", code="PRT", name="Portugal"},
{id="PW", code="PLW", name="Palau"},
{id="PY", code="PRY", name="Paraguay"},
{id="QA", code="QAT", name="Qatar"},
{id="RE", code="REU", name="Reunion"},
{id="RO", code="ROU", name="Romania"},
{id="RS", code="SRB", name="Serbia"},
{id="RU", code="RUS", name="Russia"},
{id="RW", code="RWA", name="Rwanda"},
{id="SA", code="SAU", name="Saudi Arabia"},
{id="SB", code="SLB", name="Solomon Islands"},
{id="SC", code="SYC", name="Seychelles"},
{id="SD", code="SDN", name="Sudan"},
{id="SE", code="SWE", name="Sweden"},
{id="SG", code="SGP", name="Singapore"},
{id="SH", code="SHN", name="Saint Helena"},
{id="SI", code="SVN", name="Slovenia"},
{id="SJ", code="SJM", name="Svalbard and Jan Mayen"},
{id="SK", code="SVK", name="Slovakia"},
{id="SL", code="SLE", name="Sierra Leone"},
{id="SM", code="SMR", name="San Marino"},
{id="SN", code="SEN", name="Senegal"},
{id="SO", code="SOM", name="Somalia"},
{id="SR", code="SUR", name="Suriname"},
{id="ST", code="STP", name="Sao Tome and Principe"},
{id="SV", code="SLV", name="El Salvador"},
{id="SY", code="SYR", name="Syria"},
{id="SZ", code="SWZ", name="Swaziland"},
{id="TC", code="TCA", name="Turks and Caicos Islands"},
{id="TD", code="TCD", name="Chad"},
{id="TF", code="ATF", name="French Southern Lands"},
{id="TG", code="TGO", name="Togo"},
{id="TH", code="THA", name="Thailand"},
{id="TJ", code="TJK", name="Tajikistan"},
{id="TK", code="TKL", name="Tokelau"},
{id="TL", code="TLS", name="Timor-leste"},
{id="TM", code="TKM", name="Turkmenistan"},
{id="TN", code="TUN", name="Tunisia"},
{id="TO", code="TON", name="Tonga"},
{id="TR", code="TUR", name="Turkey"},
{id="TT", code="TTO", name="Trinidad and Tobago"},
{id="TV", code="TUV", name="Tuvalu"},
{id="TW", code="TWN", name="Taiwan"},
{id="TZ", code="TZA", name="Tanzania"},
{id="UA", code="UKR", name="Ukraine"},
{id="UG", code="UGA", name="Uganda"},
{id="UM", code="UMI", name="United States Pacific Island Wildlife Refuges"},
{id="US", code="USA", name="United States"},
{id="UY", code="URY", name="Uruguay"},
{id="UZ", code="UZB", name="Uzbekistan"},
{id="VA", code="VAT", name="Vatican"},
{id="VC", code="VCT", name="Saint Vincent and the Grenadines"},
{id="VE", code="VEN", name="Venezuela"},
{id="VG", code="VGB", name="British Virgin Islands"},
{id="VI", code="VIR", name="Virgin Islands"},
{id="VN", code="VNM", name="Vietnam"},
{id="VU", code="VUT", name="Vanuatu"},
{id="WF", code="WLF", name="Wallis and Futuna"},
{id="WS", code="WSM", name="Samoa"},
{id="XK", code="KOS", name="Kosovo"},
{id="YE", code="YEM", name="Yemen"},
{id="YT", code="MYT", name="Mayotte"},
{id="ZA", code="ZAF", name="South Africa"},
{id="ZM", code="ZMB", name="Zambia"},
{id="ZW", code="ZWE", name="Zimbabwe"},
{id="EU", code="EUR", name="Europe"},}