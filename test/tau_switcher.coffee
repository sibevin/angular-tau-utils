describe "tau-switcher", ->
  beforeEach(module("tau-switcher"))

  it "check the existence of TabSwitcher", inject (TabSwitcher) ->
    expect(TabSwitcher).toBeDefined()

  it "check the existence of BoolSwitcher", inject (BoolSwitcher) ->
    expect(BoolSwitcher).toBeDefined()

  it "check the existence of CycleSwitcher", inject (CycleSwitcher) ->
    expect(CycleSwitcher).toBeDefined()
