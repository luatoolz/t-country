describe("maxmind", function()
  local t, is, maxmind
  setup(function()
    t = require "t"
    is = t.is
    maxmind = assert(require "t.maxmind")
  end)
  it("negative", function()
    assert.is_function(maxmind)
  end)
  it("positive", function()
    assert.is_true(is.ip('2.125.160.216'))

    assert.equal('bt', maxmind('67.43.156.1'))
    assert.equal('gb', maxmind('81.2.69.142'))
    assert.equal('gb', maxmind('81.2.69.143'))
    assert.equal('gb', maxmind('81.2.69.160'))
    assert.equal('se', maxmind('89.160.20.112'))
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

--[[
      "2.125.160.216/29" : {
      "67.43.156.0/24" : {
      "81.2.69.142/31" : {
      "81.2.69.144/28" : {
      "81.2.69.160/27" : {

      "81.2.69.192/28" : {
      "89.160.20.112/28" : {
      "89.160.20.128/25" : {
      "175.16.199.0/24" : {
      "202.196.224.0/20" : {
      "216.160.83.56/29" : {
      "214.78.0.0/19" : {
--]]
