describe "tau-checkbox-model", ->
  beforeEach(module("tau-checkbox-model"))

  describe "contructor", ->
    it "should set candidates with given array", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = {}
      cm = new CheckboxModel({cands: cands, model: model})
      cm.selectAll()
      expect(angular.equals(
        model, { "opt1":true, "opt2":true, "opt3":true })).toBe true

  describe "selectAll", ->
    it "should select all candidates
      if selected is true", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = { "opt1":false, "opt2":true }
      cm = new CheckboxModel({cands: cands, model: model})
      cm.selectAll()
      expect(angular.equals(
        model, { "opt1":true, "opt2":true, "opt3":true })).toBe true

    it "should unselect all candidates
      if selected is false", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = { "opt1":false, "opt2":true }
      cm = new CheckboxModel({cands: cands, model: model})
      cm.selectAll(false)
      expect(angular.equals(
        model, { "opt1":false, "opt2":false, "opt3":false })).toBe true

  describe "list", ->
    it "should show list selected candidates", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = { "opt1":false, "opt2":true }
      cm = new CheckboxModel({cands: cands, model: model})
      expect(angular.equals(cm.list(), ["opt2"])).toBe true

    it "should not list candidates
      which are not included in the initial list", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = { "opt4":true }
      cm = new CheckboxModel({cands: cands, model: model})
      expect(angular.equals(cm.list(), [])).toBe true

  describe "select", ->
    it "should select the given candidate
      if selected is true", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = { "opt1":false, "opt2":true }
      cm = new CheckboxModel({cands: cands, model: model})
      cm.select("opt1")
      expect(cm.isSelected("opt1")).toBe true
      cm.select("opt2")
      expect(cm.isSelected("opt2")).toBe true
      cm.select("opt3")
      expect(cm.isSelected("opt3")).toBe true

    it "should unselect the given candidate
      if selected is false", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = { "opt1":false, "opt2":true }
      cm = new CheckboxModel({cands: cands, model: model})
      cm.select("opt1", false)
      expect(cm.isSelected("opt1")).toBe false
      cm.select("opt2", false)
      expect(cm.isSelected("opt2")).toBe false
      cm.select("opt3", false)
      expect(cm.isSelected("opt3")).toBe false

  describe "isSelected", ->
    it "should check the given candidate
      is selected or not", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = { "opt1":false, "opt2":true }
      cm = new CheckboxModel({cands: cands, model: model})
      expect(cm.isSelected("opt1")).toBe false
      expect(cm.isSelected("opt2")).toBe true
      expect(cm.isSelected("opt3")).toBe false

    it "should return true if no candidate is given
      but something is selected", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = { "opt1":false, "opt2":true }
      cm = new CheckboxModel({cands: cands, model: model})
      expect(cm.isSelected()).toBe true

    it "should return false if no candidate is given
      and nothing is selected", inject (CheckboxModel) ->
      cands = ["opt1", "opt2", "opt3"]
      model = { "opt1":false }
      cm = new CheckboxModel({cands: cands, model: model})
      expect(cm.isSelected()).toBe false
