local country ={}
setmetatable(country, {
  __tostring = function(self)
    if self==country then
      return 'country'
    end
    return self.id
  end,
  __index=function(self, k)
    return self==country and rawget(self, string.upper(tostring(k))) or rawget(self, k)
  end,
  __newindex=function(self, k, v)
    if self==country then
      if type(k)=='table' and type(getmetatable(k))=='nil' and v==true then
        if k.id and k.c3 and k.name then
          k=setmetatable(k, getmetatable(country))
          rawset(self, string.upper(k.id), k)
          rawset(self, string.upper(k.c3), k)
          rawset(self, string.upper(k.name), k)
        end
      end
    end
  end,
  __call=function(self, k)
    if self==country then
      return self[k]
    end
  end,
})
country[{id="AD", c3="AND", name="Andorra"}]=true
country[{id="AE", c3="ARE", name="United Arab Emirates"}]=true
country[{id="AF", c3="AFG", name="Afghanistan"}]=true
country[{id="AG", c3="ATG", name="Antigua and Barbuda"}]=true
country[{id="AI", c3="AIA", name="Anguilla"}]=true
country[{id="AL", c3="ALB", name="Albania"}]=true
country[{id="AM", c3="ARM", name="Armenia"}]=true
country[{id="AN", c3="ANT", name="Netherlands Antilles"}]=true
country[{id="AO", c3="AGO", name="Angola"}]=true
country[{id="AQ", c3="ATA", name="Antarctica"}]=true
country[{id="AR", c3="ARG", name="Argentina"}]=true
country[{id="AS", c3="ASM", name="American Samoa"}]=true
country[{id="AT", c3="AUT", name="Austria"}]=true
country[{id="AU", c3="AUS", name="Australia"}]=true
country[{id="AW", c3="ABW", name="Aruba"}]=true
country[{id="AX", c3="ALA", name="Aland Islands"}]=true
country[{id="AZ", c3="AZE", name="Azerbaijan"}]=true
country[{id="BA", c3="BIH", name="Bosnia and Herzegovina"}]=true
country[{id="BB", c3="BRB", name="Barbados"}]=true
country[{id="BD", c3="BGD", name="Bangladesh"}]=true
country[{id="BE", c3="BEL", name="Belgium"}]=true
country[{id="BF", c3="BFA", name="Burkina Faso"}]=true
country[{id="BG", c3="BGR", name="Bulgaria"}]=true
country[{id="BH", c3="BHR", name="Bahrain"}]=true
country[{id="BI", c3="BDI", name="Burundi"}]=true
country[{id="BJ", c3="BEN", name="Benin"}]=true
country[{id="BL", c3="BLM", name="Saint Barthelemy"}]=true
country[{id="BM", c3="BMU", name="Bermuda"}]=true
country[{id="BN", c3="BRN", name="Brunei"}]=true
country[{id="BO", c3="BOL", name="Bolivia"}]=true
country[{id="BR", c3="BRA", name="Brazil"}]=true
country[{id="BS", c3="BHS", name="Bahamas"}]=true
country[{id="BT", c3="BTN", name="Bhutan"}]=true
country[{id="BV", c3="BVT", name="Bouvet Island"}]=true
country[{id="BW", c3="BWA", name="Botswana"}]=true
country[{id="BY", c3="BLR", name="Belarus"}]=true
country[{id="BZ", c3="BLZ", name="Belize"}]=true
country[{id="CA", c3="CAN", name="Canada"}]=true
country[{id="CC", c3="CCK", name="Cocos (Keeling} Islands"}]=true
country[{id="CD", c3="COD", name="Congo Democratic Republic"}]=true
country[{id="CF", c3="CAF", name="Central African Republic"}]=true
country[{id="CG", c3="COG", name="Congo"}]=true
country[{id="CH", c3="CHE", name="Switzerland"}]=true
country[{id="CI", c3="CIV", name="Cote D’Ivoire"}]=true
country[{id="CK", c3="COK", name="Cook Islands"}]=true
country[{id="CL", c3="CHL", name="Chile"}]=true
country[{id="CM", c3="CMR", name="Cameroon"}]=true
country[{id="CN", c3="CHN", name="China"}]=true
country[{id="CO", c3="COL", name="Colombia"}]=true
country[{id="CP", c3="CPI", name="Clipperton Island"}]=true
country[{id="CR", c3="CRI", name="Costa Rica"}]=true
country[{id="CU", c3="CUB", name="Cuba"}]=true
country[{id="CV", c3="CPV", name="Cape Verde"}]=true
country[{id="CX", c3="CXR", name="Christmas Island"}]=true
country[{id="CY", c3="CYP", name="Cyprus"}]=true
country[{id="CZ", c3="CZE", name="Czech Republic"}]=true
country[{id="DE", c3="DEU", name="Germany"}]=true
country[{id="DJ", c3="DJI", name="Djibouti"}]=true
country[{id="DK", c3="DNK", name="Denmark"}]=true
country[{id="DM", c3="DMA", name="Dominica"}]=true
country[{id="DO", c3="DOM", name="Dominican Republic"}]=true
country[{id="DZ", c3="DZA", name="Algeria"}]=true
country[{id="EC", c3="ECU", name="Ecuador"}]=true
country[{id="EE", c3="EST", name="Estonia"}]=true
country[{id="EG", c3="EGY", name="Egypt"}]=true
country[{id="EH", c3="ESH", name="Western Sahara"}]=true
country[{id="ER", c3="ERI", name="Eritrea"}]=true
country[{id="ES", c3="ESP", name="Spain"}]=true
country[{id="ET", c3="ETH", name="Ethiopia"}]=true
country[{id="FI", c3="FIN", name="Finland"}]=true
country[{id="FJ", c3="FJI", name="Fiji"}]=true
country[{id="FK", c3="FLK", name="Falkland Islands"}]=true
country[{id="FM", c3="FSM", name="Micronesia"}]=true
country[{id="FO", c3="FRO", name="Faroe Islands"}]=true
country[{id="FR", c3="FRA", name="France"}]=true
country[{id="GA", c3="GAB", name="Gabon"}]=true
country[{id="UK", c3="GBR", name="United Kingdom"}]=true
country[{id="GD", c3="GRD", name="Grenada"}]=true
country[{id="GE", c3="GEO", name="Georgia"}]=true
country[{id="GF", c3="GUF", name="French Guiana"}]=true
country[{id="GG", c3="GGY", name="Guernsey"}]=true
country[{id="GH", c3="GHA", name="Ghana"}]=true
country[{id="GI", c3="GIB", name="Gibraltar"}]=true
country[{id="GL", c3="GRL", name="Greenland"}]=true
country[{id="GM", c3="GMB", name="Gambia"}]=true
country[{id="GN", c3="GIN", name="Guinea"}]=true
country[{id="GP", c3="GLP", name="Guadeloupe"}]=true
country[{id="GQ", c3="GNQ", name="Equatorial Guinea"}]=true
country[{id="GR", c3="GRC", name="Greece"}]=true
country[{id="GS", c3="SGS", name="South Georgia and the South Sandwich Islands"}]=true
country[{id="GT", c3="GTM", name="Guatemala"}]=true
country[{id="GU", c3="GUM", name="Guam"}]=true
country[{id="GW", c3="GNB", name="Guinea-bissau"}]=true
country[{id="GY", c3="GUY", name="Guyana"}]=true
country[{id="HK", c3="HKG", name="Hong Kong"}]=true
country[{id="HM", c3="HMD", name="Heard Island and Mcdonald Islands"}]=true
country[{id="HN", c3="HND", name="Honduras"}]=true
country[{id="HR", c3="HRV", name="Croatia"}]=true
country[{id="HT", c3="HTI", name="Haiti"}]=true
country[{id="HU", c3="HUN", name="Hungary"}]=true
country[{id="ID", c3="IDN", name="Indonesia"}]=true
country[{id="IE", c3="IRL", name="Ireland"}]=true
country[{id="IL", c3="ISR", name="Israel"}]=true
country[{id="IM", c3="IMN", name="Isle of Man"}]=true
country[{id="IN", c3="IND", name="India"}]=true
country[{id="IO", c3="IOT", name="British Indian Ocean Territory"}]=true
country[{id="IQ", c3="IRQ", name="Iraq"}]=true
country[{id="IR", c3="IRN", name="Iran"}]=true
country[{id="IS", c3="ISL", name="Iceland"}]=true
country[{id="IT", c3="ITA", name="Italy"}]=true
country[{id="JE", c3="JEY", name="Jersey"}]=true
country[{id="JM", c3="JAM", name="Jamaica"}]=true
country[{id="JO", c3="JOR", name="Jordan"}]=true
country[{id="JP", c3="JPN", name="Japan"}]=true
country[{id="KE", c3="KEN", name="Kenya"}]=true
country[{id="KG", c3="KGZ", name="Kyrgyzstan"}]=true
country[{id="KH", c3="KHM", name="Cambodia"}]=true
country[{id="KI", c3="KIR", name="Kiribati"}]=true
country[{id="KM", c3="COM", name="Comoros"}]=true
country[{id="KN", c3="KNA", name="Saint Kitts and Nevis"}]=true
country[{id="KP", c3="PRK", name="North Korea"}]=true
country[{id="KR", c3="KOR", name="South Korea"}]=true
country[{id="KW", c3="KWT", name="Kuwait"}]=true
country[{id="KY", c3="CYM", name="Cayman Islands"}]=true
country[{id="KZ", c3="KAZ", name="Kazakhstan"}]=true
country[{id="LA", c3="LAO", name="Laos"}]=true
country[{id="LB", c3="LBN", name="Lebanon"}]=true
country[{id="LC", c3="LCA", name="Saint Lucia"}]=true
country[{id="LI", c3="LIE", name="Liechtenstein"}]=true
country[{id="LK", c3="LKA", name="Sri Lanka"}]=true
country[{id="LR", c3="LBR", name="Liberia"}]=true
country[{id="LS", c3="LSO", name="Lesotho"}]=true
country[{id="LT", c3="LTU", name="Lithuania"}]=true
country[{id="LU", c3="LUX", name="Luxembourg"}]=true
country[{id="LV", c3="LVA", name="Latvia"}]=true
country[{id="LY", c3="LBY", name="Libya"}]=true
country[{id="MA", c3="MAR", name="Morocco"}]=true
country[{id="MC", c3="MCO", name="Monaco"}]=true
country[{id="MD", c3="MDA", name="Moldova"}]=true
country[{id="ME", c3="MNE", name="Montenegro"}]=true
country[{id="MF", c3="MAF", name="Saint Martin"}]=true
country[{id="MG", c3="MDG", name="Madagascar"}]=true
country[{id="MH", c3="MHL", name="Marshall Islands"}]=true
country[{id="MK", c3="MKD", name="Macedonia"}]=true
country[{id="ML", c3="MLI", name="Mali"}]=true
country[{id="MM", c3="MMR", name="Burma"}]=true
country[{id="MN", c3="MNG", name="Mongolia"}]=true
country[{id="MO", c3="MAC", name="Macau"}]=true
country[{id="MP", c3="MNP", name="Northern Mariana Islands"}]=true
country[{id="MQ", c3="MTQ", name="Martinique"}]=true
country[{id="MR", c3="MRT", name="Mauritania"}]=true
country[{id="MS", c3="MSR", name="Montserrat"}]=true
country[{id="MT", c3="MLT", name="Malta"}]=true
country[{id="MU", c3="MUS", name="Mauritius"}]=true
country[{id="MV", c3="MDV", name="Maldives"}]=true
country[{id="MW", c3="MWI", name="Malawi"}]=true
country[{id="MX", c3="MEX", name="Mexico"}]=true
country[{id="MY", c3="MYS", name="Malaysia"}]=true
country[{id="MZ", c3="MOZ", name="Mozambique"}]=true
country[{id="NA", c3="NAM", name="Namibia"}]=true
country[{id="NC", c3="NCL", name="New Caledonia"}]=true
country[{id="NE", c3="NER", name="Niger"}]=true
country[{id="NF", c3="NFK", name="Norfolk Island"}]=true
country[{id="NG", c3="NGA", name="Nigeria"}]=true
country[{id="NI", c3="NIC", name="Nicaragua"}]=true
country[{id="NL", c3="NLD", name="Netherlands"}]=true
country[{id="NO", c3="NOR", name="Norway"}]=true
country[{id="NP", c3="NPL", name="Nepal"}]=true
country[{id="NR", c3="NRU", name="Nauru"}]=true
country[{id="NU", c3="NIU", name="Niue"}]=true
country[{id="NZ", c3="NZL", name="New Zealand"}]=true
country[{id="OM", c3="OMN", name="Oman"}]=true
country[{id="PA", c3="PAN", name="Panama"}]=true
country[{id="PE", c3="PER", name="Peru"}]=true
country[{id="PF", c3="PYF", name="French Polynesia"}]=true
country[{id="PG", c3="PNG", name="Papua New Guinea"}]=true
country[{id="PH", c3="PHL", name="Philippines"}]=true
country[{id="PK", c3="PAK", name="Pakistan"}]=true
country[{id="PL", c3="POL", name="Poland"}]=true
country[{id="PM", c3="SPM", name="Saint Pierre and Miquelon"}]=true
country[{id="PN", c3="PCN", name="Pitcairn"}]=true
country[{id="PR", c3="PRI", name="Puerto Rico"}]=true
country[{id="PS", c3="PSE", name="Palestinian Territory"}]=true
country[{id="PT", c3="PRT", name="Portugal"}]=true
country[{id="PW", c3="PLW", name="Palau"}]=true
country[{id="PY", c3="PRY", name="Paraguay"}]=true
country[{id="QA", c3="QAT", name="Qatar"}]=true
country[{id="RE", c3="REU", name="Reunion"}]=true
country[{id="RO", c3="ROU", name="Romania"}]=true
country[{id="RS", c3="SRB", name="Serbia"}]=true
country[{id="RU", c3="RUS", name="Russia"}]=true
country[{id="RW", c3="RWA", name="Rwanda"}]=true
country[{id="SA", c3="SAU", name="Saudi Arabia"}]=true
country[{id="SB", c3="SLB", name="Solomon Islands"}]=true
country[{id="SC", c3="SYC", name="Seychelles"}]=true
country[{id="SD", c3="SDN", name="Sudan"}]=true
country[{id="SE", c3="SWE", name="Sweden"}]=true
country[{id="SG", c3="SGP", name="Singapore"}]=true
country[{id="SH", c3="SHN", name="Saint Helena"}]=true
country[{id="SI", c3="SVN", name="Slovenia"}]=true
country[{id="SJ", c3="SJM", name="Svalbard and Jan Mayen"}]=true
country[{id="SK", c3="SVK", name="Slovakia"}]=true
country[{id="SL", c3="SLE", name="Sierra Leone"}]=true
country[{id="SM", c3="SMR", name="San Marino"}]=true
country[{id="SN", c3="SEN", name="Senegal"}]=true
country[{id="SO", c3="SOM", name="Somalia"}]=true
country[{id="SR", c3="SUR", name="Suriname"}]=true
country[{id="ST", c3="STP", name="Sao Tome and Principe"}]=true
country[{id="SV", c3="SLV", name="El Salvador"}]=true
country[{id="SY", c3="SYR", name="Syria"}]=true
country[{id="SZ", c3="SWZ", name="Swaziland"}]=true
country[{id="TC", c3="TCA", name="Turks and Caicos Islands"}]=true
country[{id="TD", c3="TCD", name="Chad"}]=true
country[{id="TF", c3="ATF", name="French Southern Lands"}]=true
country[{id="TG", c3="TGO", name="Togo"}]=true
country[{id="TH", c3="THA", name="Thailand"}]=true
country[{id="TJ", c3="TJK", name="Tajikistan"}]=true
country[{id="TK", c3="TKL", name="Tokelau"}]=true
country[{id="TL", c3="TLS", name="Timor-leste"}]=true
country[{id="TM", c3="TKM", name="Turkmenistan"}]=true
country[{id="TN", c3="TUN", name="Tunisia"}]=true
country[{id="TO", c3="TON", name="Tonga"}]=true
country[{id="TR", c3="TUR", name="Turkey"}]=true
country[{id="TT", c3="TTO", name="Trinidad and Tobago"}]=true
country[{id="TV", c3="TUV", name="Tuvalu"}]=true
country[{id="TW", c3="TWN", name="Taiwan"}]=true
country[{id="TZ", c3="TZA", name="Tanzania"}]=true
country[{id="UA", c3="UKR", name="Ukraine"}]=true
country[{id="UG", c3="UGA", name="Uganda"}]=true
country[{id="UM", c3="UMI", name="United States Pacific Island Wildlife Refuges"}]=true
country[{id="US", c3="USA", name="United States"}]=true
country[{id="UY", c3="URY", name="Uruguay"}]=true
country[{id="UZ", c3="UZB", name="Uzbekistan"}]=true
country[{id="VA", c3="VAT", name="Vatican"}]=true
country[{id="VC", c3="VCT", name="Saint Vincent and the Grenadines"}]=true
country[{id="VE", c3="VEN", name="Venezuela"}]=true
country[{id="VG", c3="VGB", name="British Virgin Islands"}]=true
country[{id="VI", c3="VIR", name="Virgin Islands"}]=true
country[{id="VN", c3="VNM", name="Vietnam"}]=true
country[{id="VU", c3="VUT", name="Vanuatu"}]=true
country[{id="WF", c3="WLF", name="Wallis and Futuna"}]=true
country[{id="WS", c3="WSM", name="Samoa"}]=true
country[{id="XK", c3="KOS", name="Kosovo"}]=true
country[{id="YE", c3="YEM", name="Yemen"}]=true
country[{id="YT", c3="MYT", name="Mayotte"}]=true
country[{id="ZA", c3="ZAF", name="South Africa"}]=true
country[{id="ZM", c3="ZMB", name="Zambia"}]=true
country[{id="ZW", c3="ZWE", name="Zimbabwe"}]=true
country[{id="EU", c3="EUR", name="Europe"}]=true
rawset(country, string.upper('GB'), country.uk)
return country
