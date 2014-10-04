describe "tab-switcher", ->
  beforeEach(module("tau-switcher"))

  describe "init, getBool", ->
    it "should set the default bool to false
      if no bool is given during init", inject (BoolSwitcher) ->
      bs = new BoolSwitcher()
      expect(bs.getBool()).toBe false
      bs.switch()
      bs.reset()
      expect(bs.getBool()).toBe false

    it "should set the default bool
      if a value is given during init", inject (BoolSwitcher) ->
      init_bool = false
      bs = new BoolSwitcher(init_bool)
      expect(bs.getBool()).toBe init_bool
      bs.switch()
      bs.reset()
      expect(bs.getBool()).toBe init_bool

  describe "switch", ->
    it "should change the current bool
      with the not-result", inject (BoolSwitcher) ->
      bs = new BoolSwitcher()
      expect(bs.getBool()).toBe false
      bs.switch()
      expect(bs.getBool()).toBe true
      bs.switch()
      expect(bs.getBool()).toBe false

  describe "reset", ->
    it "should reset bool value", inject (BoolSwitcher) ->
      init_bool = false
      bs = new BoolSwitcher(init_bool)
      bs.reset()
      expect(bs.getBool()).toBe init_bool

  describe "setBool", ->
    it "should set bool value", inject (BoolSwitcher) ->
      init_bool = false
      bs = new BoolSwitcher(init_bool)
      bool = true
      bs.setBool(bool)
      expect(bs.getBool()).toBe bool
