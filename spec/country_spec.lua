describe("country", function()
  local t, is, country
  setup(function()
    t = require "t"
    is = t.is
    country = assert(require "t.country", "failed to load t.country")
  end)
  it("meta", function()
    assert.is_true(is.callable(country))
  end)
  it("full lookup", function()
    assert.equal('us', country('UNITED STATES').id)
    assert.equal('us', country('UNITED States').id)
    assert.equal('us', country('United States').id)
    assert.equal('us', country('united states').id)
    assert.equal('us', country('united States').id)
    assert.equal('us', country('United states').id)

    assert.equal('us', country['UNITED STATES'].id)
    assert.equal('us', country['UNITED States'].id)
    assert.equal('us', country['United States'].id)
    assert.equal('us', country['united states'].id)
    assert.equal('us', country['united States'].id)
    assert.equal('us', country['United states'].id)

    assert.equal('ru', country('RUSSIA').id)
  end)
  it("id lookup", function()
    assert.equal('us', country('US').id)
    assert.equal('us', country('us').id)
    assert.equal('us', country('Us').id)
    assert.equal('us', country('uS').id)

    assert.equal('us', country['US'].id)
    assert.equal('us', country['us'].id)
    assert.equal('us', country['Us'].id)
    assert.equal('us', country['uS'].id)

    assert.equal('us', country.US.id)
    assert.equal('us', country.us.id)
    assert.equal('us', country.Us.id)
    assert.equal('us', country.uS.id)
  end)
  it("3 sym lookup", function()
    assert.equal('us', country('USA').id)
    assert.equal('us', country('usa').id)
    assert.equal('us', country('Usa').id)
    assert.equal('us', country('uSa').id)

    assert.equal('us', country['USA'].id)
    assert.equal('us', country['usa'].id)
    assert.equal('us', country['Usa'].id)
    assert.equal('us', country['uSa'].id)

    assert.equal('us', country.USA.id)
    assert.equal('us', country.usa.id)
    assert.equal('us', country.Usa.id)
    assert.equal('us', country.uSa.id)
  end)
  it("other fields", function()
    assert.equal('usa', country('US').code)
    assert.equal('usa', country.US.code)
    assert.equal('United States', country['US'].name)
  end)
  it("nil lookup", function()
    assert.is_nil(country())
    assert.is_nil(country(nil))
    assert.is_nil(country(''))
  end)
  it("__tostring", function()
    assert.equal('us', tostring(country('US')))
  end)
  it("__iter", function()
    for c in table.iter(country) do
      assert.equal(c.id, tostring(c))
    end
  end)
  it("__pairs", function()
    for k,v in pairs(country) do
      assert.equal(k, tostring(v))
    end
  end)
  it("ip lookup country", function()
    assert.equal('us', country('214.78.0.0'))
    assert.equal('us', country('216.160.83.56'))
    assert.equal('ph', country('202.196.224.0'))
    assert.equal('cn', country('175.16.199.0'))
    assert.equal('se', country('89.160.20.128'))
  end)
  it("negative lookup", function()
    assert.is_nil(country('0.-1.0.0'))
    assert.is_nil(country('0.0.0.0'))
    assert.is_nil(country('1.1.1.1'))
    assert.is_nil(country('255.255.255.255'))
  end)
--  it("ip lookup host", function()
--    assert.is_nil(country('0.0.0.0'))
--    assert.is_nil(country('lua.org'))
--  end)
end)