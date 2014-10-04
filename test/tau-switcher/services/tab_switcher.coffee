describe "tab-switcher", ->
  beforeEach(module("tau-switcher"))

  describe "init", ->
    it "should set the default tab to 'none'
      if no tab is given during init", inject (TabSwitcher) ->
      ts = new TabSwitcher()
      expect(ts.isTab("none")).toBe true
      ts.switch("other_tab")
      ts.reset()
      expect(ts.isTab("none")).toBe true

    it "should set the default tab
      if a tab is given during init", inject (TabSwitcher) ->
      init_tab = "init_tab"
      ts = new TabSwitcher(init_tab)
      expect(ts.isTab(init_tab)).toBe true
      ts.switch("other_tab")
      ts.reset()
      expect(ts.isTab(init_tab)).toBe true

  describe "switch", ->
    it "should set the current tab with given tab if switch() is called,
      and reset tab if switch() is called again", inject (TabSwitcher) ->
      init_tab = "init_tab"
      ts = new TabSwitcher(init_tab)
      tab = "tab"
      ts.switch(tab)
      expect(ts.isTab(tab)).toBe true
      ts.switch(tab)
      expect(ts.isTab(init_tab)).toBe true

  describe "reset", ->
    it "should reset tab", inject (TabSwitcher) ->
      init_tab = "init_tab"
      ts = new TabSwitcher(init_tab)
      tab = "tab"
      ts.switch(tab)
      ts.reset()
      expect(ts.isTab(init_tab)).toBe true

  describe "setTab", ->
    it "should set tab", inject (TabSwitcher) ->
      init_tab = "init_tab"
      ts = new TabSwitcher(init_tab)
      tab = "tab"
      ts.setTab(tab)
      expect(ts.isTab(tab)).toBe true

  describe "getTab", ->
    it "should get the current tab", inject (TabSwitcher) ->
      init_tab = "init_tab"
      ts = new TabSwitcher(init_tab)
      tab = "tab"
      ts.setTab(tab)
      expect(ts.getTab(tab)).toBe tab

  describe "isTab", ->
    it "should check the current tab is matched
      with the given tab", inject (TabSwitcher) ->
      init_tab = "init_tab"
      ts = new TabSwitcher(init_tab)
      tab = "tab"
      ts.setTab(tab)
      expect(ts.isTab(tab)).toBe true
      other_tab = "other_tab"
      ts.setTab(other_tab)
      expect(ts.isTab(tab)).toBe false

    it "should check the current tab is in the
      given tabs", inject (TabSwitcher) ->
      init_tab = "init_tab"
      ts = new TabSwitcher(init_tab)
      tabs = ["tab1", "tab2", "tab3"]
      tab1 = "tab1"
      ts.setTab(tab1)
      expect(ts.isTab(tabs)).toBe true
      other_tab = "other_tab"
      ts.setTab(other_tab)
      expect(ts.isTab(tabs)).toBe false
