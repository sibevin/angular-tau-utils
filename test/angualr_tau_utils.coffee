describe "angular-tau-utils", ->
  beforeEach(module("tau-utils"))

  it "check the existence of TabSwitcher", inject (TabSwitcher) ->
    expect(TabSwitcher).toBeDefined()

  it "check the existence of BoolSwitcher", inject (BoolSwitcher) ->
    expect(BoolSwitcher).toBeDefined()

  it "check the existence of CycleSwitcher", inject (CycleSwitcher) ->
    expect(CycleSwitcher).toBeDefined()

  it "check the existence of PipeSwitcher", inject (PipeSwitcher) ->
    expect(PipeSwitcher).toBeDefined()

  it "check the existence of CheckboxModel", inject (CheckboxModel) ->
    expect(CheckboxModel).toBeDefined()
