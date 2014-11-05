# The checkbox model service
angular.module("tau-checkbox-model").factory "CheckboxModel", ->
  # The checkbox model class
  class CheckboxModel

    # The checkbox model data
    _cm_data: { cands: [], model: {} }

    # The checkbox model constructor
    #
    # @param cm_data [Object] An object contains "cands" and "model" attributes,
    #   which "cands" is an array of initial candidates and "model" is the
    #   checkbox model.
    # @return [CheckboxModel]
    #
    constructor: (cm_data) ->
      @_cm_data = cm_data

    # Select/Unselect all candidates
    #
    # @param selected [Boolean] true for selection , false for un-selection.
    #
    selectAll: (selected = true) =>
      for cand in @_cm_data.cands
        @_cm_data.model[cand] = if selected then true else false

    # List the selected candidates
    #
    # @return [Array<String>] The selected candidates.
    #
    list: =>
      results = []
      for cand in @_cm_data.cands
        if @_cm_data.model[cand]
          results.push(cand)
      results

    # Select/Unselect one of candidate
    #
    # @param cand [String] The candidate to select/unselect.
    # @param selected [Boolean] true for selection, false for un-selection.
    #
    select: (cand, selected = true) =>
      if cand in @_cm_data.cands
        @_cm_data.model[cand] = if selected then true else false

    # Check the given candidate is selected or not
    #
    # @param cand [String] The candidate to check. If no candidate is given, it
    #   return true if something is selected.
    # @return [Boolean] true if the given candidate is selected, otherwise
    #   false.
    #
    isSelected: (cand = null) =>
      if cand == null
        for cand in @_cm_data.cands
          return true if @_cm_data.model[cand]
        return false
      else
        return false if cand not in @_cm_data.cands
        return if @_cm_data.model[cand] then true else false

  return CheckboxModel
