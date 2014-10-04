describe "angular-tau-utils", ->
  beforeEach(module("angular-tau-utils"))

  it "check the existence of TabSwitcher", inject (TabSwitcher) ->
    expect(TabSwitcher).toBeDefined()

  it "check the existence of BoolSwitcher", inject (BoolSwitcher) ->
    expect(BoolSwitcher).toBeDefined()

  it "check the existence of CycleSwitcher", inject (CycleSwitcher) ->
    expect(CycleSwitcher).toBeDefined()
