describe "tab-switcher", ->
  beforeEach(module("tau-switcher"))

  describe "init", ->
    it "should set the default tabs to ['none']
      if no tabs are given during init", inject (CycleSwitcher) ->
      cs = new CycleSwitcher()
      expect(cs.isTab("none")).toBe true
      cs.next()
      expect(cs.isTab("none")).toBe true

    it "should set the default tabs and the first tab to be default index
      if tabs is given during init", inject (CycleSwitcher) ->
      first_tab = "tab1"
      tabs = [first_tab, "tab2", "tab3"]
      cs = new CycleSwitcher(tabs)
      expect(cs.isTab(first_tab)).toBe true

  describe "reset", ->
    it "should reset tab", inject (CycleSwitcher) ->
      first_tab = "tab1"
      tabs = [first_tab, "tab2", "tab3"]
      cs = new CycleSwitcher(tabs)
      cs.next()
      cs.reset()
      expect(cs.isTab(first_tab)).toBe true

  describe "getTab", ->
    it "should get the current tab", inject (CycleSwitcher) ->
      first_tab = "tab1"
      tabs = [first_tab, "tab2", "tab3"]
      cs = new CycleSwitcher(tabs)
      expect(cs.getTab()).toBe first_tab

  describe "isTab", ->
    it "should check the current tab is matched
      with the given tab", inject (CycleSwitcher) ->
      first_tab = "tab1"
      tabs = [first_tab, "tab2", "tab3"]
      cs = new CycleSwitcher(tabs)
      expect(cs.isTab(first_tab)).toBe true
      other_tab = "other_tab"
      expect(cs.isTab(other_tab)).toBe false

    it "should check the current tab is in the
      given tabs", inject (CycleSwitcher) ->
      first_tab = "tab1"
      tabs = [first_tab, "tab2", "tab3"]
      cs = new CycleSwitcher(tabs)
      given_tabs = [first_tab]
      expect(cs.isTab(given_tabs)).toBe true
      given_tabs = ["other_tab"]
      expect(cs.isTab(given_tabs)).toBe false

  describe "next", ->
    it "should goto the next tab", inject (CycleSwitcher) ->
      first_tab = "tab1"
      second_tab = "tab2"
      last_tab = "tab3"
      tabs = [first_tab, second_tab, last_tab]
      cs = new CycleSwitcher(tabs)
      expect(cs.getTab()).toBe first_tab
      cs.next()
      expect(cs.getTab()).toBe second_tab

    it "should goto the first tab
      if the current tab is the last one", inject (CycleSwitcher) ->
      first_tab = "tab1"
      second_tab = "tab2"
      last_tab = "tab3"
      tabs = [first_tab, second_tab, last_tab]
      cs = new CycleSwitcher(tabs)
      cs.next()
      cs.next()
      expect(cs.getTab()).toBe last_tab
      cs.next()
      expect(cs.getTab()).toBe first_tab

  describe "prev", ->
    it "should goto the previous tab", inject (CycleSwitcher) ->
      first_tab = "tab1"
      second_tab = "tab2"
      last_tab = "tab3"
      tabs = [first_tab, second_tab, last_tab]
      cs = new CycleSwitcher(tabs)
      expect(cs.getTab()).toBe first_tab
      cs.next()
      cs.next()
      expect(cs.getTab()).toBe last_tab
      cs.prev()
      expect(cs.getTab()).toBe second_tab

    it "should goto the last tab
      if the current tab is the first one", inject (CycleSwitcher) ->
      first_tab = "tab1"
      second_tab = "tab2"
      last_tab = "tab3"
      tabs = [first_tab, second_tab, last_tab]
      cs = new CycleSwitcher(tabs)
      expect(cs.getTab()).toBe first_tab
      cs.prev()
      expect(cs.getTab()).toBe last_tab

  describe "setTab", ->
    it "should set the current tab to the given tab", inject (CycleSwitcher) ->
      target_tab = "tab2"
      tabs = ["tab1", target_tab, "tab3"]
      cs = new CycleSwitcher(tabs)
      cs.setTab(target_tab)
      expect(cs.getTab()).toBe target_tab

    it "should keep the current tab
      if the given tab is not in the tabs", inject (CycleSwitcher) ->
      invalid_tab = "invalid_tab"
      first_tab = "tab1"
      tabs = [first_tab, "tab2", "tab3"]
      cs = new CycleSwitcher(tabs)
      cs.setTab(invalid_tab)
      expect(cs.getTab()).toBe first_tab
