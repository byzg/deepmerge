((root, factory) ->
  if typeof define == 'function' and define.amd
    define factory
  else if typeof exports == 'object'
    module.exports = factory()
  else
    root.deepmerge = factory()
) this, ->
  (target, src) ->
    array = Array.isArray(src)
    dst = array and [] or {}
    if array
      target = target or []
      dst = dst.concat(target)
      src.forEach (e, i) ->
        if typeof dst[i] == 'undefined'
          dst[i] = e
        else
          if target.indexOf(e) == -1
            dst.push e
    else
      if target and typeof target == 'object'
        Object.keys(target).forEach (key) ->
          dst[key] = target[key]
      Object.keys(src).forEach (key) ->
        if typeof src[key] != 'object' or !src[key]
          dst[key] = src[key]
        else
          if !target[key]
            dst[key] = src[key]
          else
            dst[key] = deepmerge(target[key], src[key])
    dst
