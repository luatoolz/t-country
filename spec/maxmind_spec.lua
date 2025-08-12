describe("maxmind", function()
  local t, is, maxmind
  setup(function()
    t = require "t"
    is = t.is
    maxmind = assert(t.maxmind)
  end)
  it("negative", function()
    assert.is_function(maxmind)
  end)
  it("positive", function()
    assert.is_true(is.net.ip('2.125.160.216'))

    assert.equal('bt', maxmind('67.43.156.1'))
    assert.equal('gb', maxmind('81.2.69.142'))
    assert.equal('gb', maxmind('81.2.69.143'))
    assert.equal('gb', maxmind('81.2.69.160'))
    assert.equal('se', maxmind('89.160.20.112'))

    assert.equal('se', maxmind('89.160.20.128'))
    assert.equal('se', maxmind('89-160-20-128.cust.bredband2.com'))
  end)
  it("negative", function()
    assert.is_nil(maxmind('1.1.1.1'))

    assert.is_nil(maxmind('255.255.255.255'))
    assert.is_nil(maxmind('777.888.999.666'))
  end)
  it("nil", function()
    assert.is_nil(maxmind())
    assert.is_nil(maxmind(nil))
    assert.is_nil(maxmind(''))
  end)
end)