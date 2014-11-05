describe "tau-checkbox-model", ->
  beforeEach(module("tau-checkbox-model"))

  it "check the existence of CheckboxModel", inject (CheckboxModel) ->
    expect(CheckboxModel).toBeDefined()
