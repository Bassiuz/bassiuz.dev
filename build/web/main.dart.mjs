// Compiles a dart2wasm-generated main module from `source` which can then
// be instantiated via the `instantiate` method.
//
// `source` needs to be a `Response` object (or promise thereof) e.g. created
// via the `fetch()` JS API.
export async function compileStreaming(source) {
  const builtins = {builtins: ['js-string']};
  return new CompiledApp(
      await WebAssembly.compileStreaming(source, builtins), builtins);
}

// Compiles a dart2wasm-generated wasm module from `bytes` which is then
// instantiable via the `instantiate` method.
export async function compile(bytes) {
  const builtins = {builtins: ['js-string']};
  return new CompiledApp(await WebAssembly.compile(bytes, builtins), builtins);
}

class CompiledApp {
  constructor(module, builtins) {
    this.module = module;
    this.builtins = builtins;
  }

  // The second argument is an options object containing:
  // `loadDeferredModules` is a JS function that takes an array of module names
  //   matching wasm files produced by the dart2wasm compiler. It also takes a
  //   callback that should be invoked for each loaded module with 2 arguments:
  //   (1) the module name, (2) the loaded module in a format supported by
  //   `WebAssembly.compile` or `WebAssembly.compileStreaming`. The callback
  //   returns a Promise that resolves when the module is instantiated.
  //   loadDeferredModules should return a Promise that resolves when all the
  //   modules have been loaded and the callback promises have resolved.
  // `loadDeferredId` is a JS function that takes load ID produced by the
  //   compiler when the `use-load-ids` option is passed. Each load ID maps to
  //   one or more wasm files as specified in the emitted JSON file. It also
  //   takes a callback that should be invoked for each loaded module with 2
  //   arguments: (1) the module name, (2) the loaded module in a format
  //   supported by `WebAssembly.compile` or `WebAssembly.compileStreaming`.
  //   The callback returns a Promise that resolves when the module is
  //   instantiated.
  //   loadDeferredId should return a Promise that resolves when all the
  //   modules have been loaded and the callback promises have resolved.
  async instantiate(additionalImports, {loadDeferredModules, loadDeferredId} = {}) {
    let dartInstance;

    // Prints to the console
    function printToConsole(value) {
      if (typeof dartPrint == "function") {
        dartPrint(value);
        return;
      }
      if (typeof console == "object" && typeof console.log != "undefined") {
        console.log(value);
        return;
      }
      if (typeof print == "function") {
        print(value);
        return;
      }

      throw "Unable to print message: " + value;
    }

    // A special symbol attached to functions that wrap Dart functions.
    const jsWrappedDartFunctionSymbol = Symbol("JSWrappedDartFunction");

    function finalizeWrapper(dartFunction, wrapped) {
      wrapped.dartFunction = dartFunction;
      wrapped[jsWrappedDartFunctionSymbol] = true;
      return wrapped;
    }

    // Imports
    const dart2wasm = {
            AB: o => o instanceof RegExp,
      AC: o => o.byteOffset,
      AD: x0 => x0.state,
      AE: (x0,x1) => x0.removeProperty(x1),
      AF: (x0,x1) => { x0.noValidate = x1 },
      AG: x0 => x0.offsetX,
      AH: x0 => x0.clientHeight,
      AI: x0 => x0.id,
      AJ: x0 => x0.decode(),
      AK: x0 => x0.hostElement,
      B: s => printToConsole(s),
      BB: o => o,
      BC: o => o.buffer,
      BD: (x0,x1,x2) => x0.addEventListener(x1,x2),
      BE: (x0,x1) => x0.appendChild(x1),
      BF: (x0,x1) => x0.removeAttribute(x1),
      BG: x0 => x0.type,
      BH: x0 => x0.innerWidth,
      BI: x0 => x0.offsetHeight,
      BJ: (x0,x1) => { x0.decoding = x1 },
      BK: x0 => x0.location,
      C: Function.prototype.call.bind(Number.prototype.toString),
      CB: o => {
        if (o === undefined || o === null) return 0;
        if (typeof o === 'boolean') return 1;
        return 2;
      },
      CC: (b, o) => new DataView(b, o),
      CD: (x0,x1) => x0.go(x1),
      CE: x0 => x0.debugShowSemanticsNodes,
      CF: x0 => x0.isConnected,
      CG: x0 => x0.hasFocus(),
      CH: x0 => x0.width,
      CI: x0 => x0.offsetWidth,
      CJ: (x0,x1) => { x0.crossOrigin = x1 },
      CK: (x0,x1) => x0.getModifierState(x1),
      D: Function.prototype.call.bind(BigInt.prototype.toString),
      DB: x0 => x0.dotAll,
      DC: (b, o, l) => new DataView(b, o, l),
      DD: (s) => +s,
      DE: (o, c) => o instanceof c,
      DF: x0 => x0.click(),
      DG: x0 => x0.shiftKey,
      DH: x0 => x0.clientWidth,
      DI: x0 => x0.stopPropagation(),
      DJ: (x0,x1) => x0.createObjectURL(x1),
      DK: x0 => x0.metaKey,
      E: (exn) => {
        let stackString = exn.toString();
        let frames = stackString.split('\n');
        let drop = 4;
        if (frames[0].startsWith('Error')) {
            drop += 1;
        }
        return frames.slice(drop).join('\n');
      },
      EB: x0 => x0.unicode,
      EC: Function.prototype.call.bind(DataView.prototype.getUint8),
      ED: s => {
        if (!/^\s*[+-]?(?:Infinity|NaN|(?:\.\d+|\d+(?:\.\d*)?)(?:[eE][+-]?\d+)?)\s*$/.test(s)) {
          return NaN;
        }
        return parseFloat(s);
      },
      EE: x0 => x0.vendor,
      EF: (x0,x1) => x0.getElementsByClassName(x1),
      EG: x0 => x0.visibilityState,
      EH: (x0,x1) => x0.removeChild(x1),
      EI: x0 => x0.disabled,
      EJ: x0 => x0.URL,
      EK: x0 => x0.altKey,
      F: () => new Error().stack,
      FB: x0 => x0.ignoreCase,
      FC: Function.prototype.call.bind(DataView.prototype.setUint8),
      FD: x0 => x0.hash,
      FE: (x0,x1) => x0.createTextNode(x1),
      FF: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmF32ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      FG: x0 => x0.disconnect(),
      FH: x0 => x0.firstChild,
      FI: (x0,x1) => { x0.min = x1 },
      FJ: x0 => new Blob(x0),
      FK: x0 => x0.ctrlKey,
      G: s => JSON.stringify(s),
      GB: x0 => x0.multiline,
      GC: Function.prototype.call.bind(DataView.prototype.getFloat64),
      GD: x0 => x0.location,
      GE: (x0,x1) => { x0.nonce = x1 },
      GF: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmF64ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      GG: x0 => new Intl.Locale(x0),
      GH: x0 => x0.viewConstraints,
      GI: (x0,x1) => { x0.max = x1 },
      GJ: (x0,x1,x2,x3,x4) => ({type: x0,data: x1,premultiplyAlpha: x2,colorSpaceConversion: x3,preferAnimation: x4}),
      GK: x0 => x0.isComposing,
      H: Function.prototype.call.bind(Number.prototype.toString),
      HB: (o, p, r) => o.replace(p, () => r),
      HC: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Float64Array) return 1;
        return 2;
      },
      HD: x0 => x0.search,
      HE: x0 => x0.nonce,
      HF: (x0,x1) => x0.contains(x1),
      HG: x0 => x0.region,
      HH: x0 => x0.hostElement,
      HI: (x0,x1) => { x0.disabled = x1 },
      HJ: x0 => new window.ImageDecoder(x0),
      HK: x0 => x0.code,
      I: Function.prototype.call.bind(String.prototype.indexOf),
      IB: s => s.toUpperCase(),
      IC: (t, s) => t.set(s),
      ID: o => {
        if (o === null || o === undefined) return 0;
        if (typeof(o) === 'string') return 1;
        return 2;
      },
      IE: () => globalThis.window.flutterConfiguration,
      IF: x0 => x0.target,
      IG: x0 => x0.script,
      IH: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      II: (x0,x1) => { x0.scrollLeft = x1 },
      IJ: x0 => x0.name,
      IK: x0 => x0.repeat,
      J: (s, p, i) => s.lastIndexOf(p, i),
      JB: Object.is,
      JC: Function.prototype.call.bind(DataView.prototype.setFloat32),
      JD: x0 => x0.pathname,
      JE: (x0,x1) => x0.attachShadow(x1),
      JF: (x0,x1) => x0.dispatchEvent(x1),
      JG: x0 => x0.language,
      JH: x0 => ({runApp: x0}),
      JI: (x0,x1) => { x0.spellcheck = x1 },
      JJ: x0 => x0.repetitionCount,
      JK: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      K: (exn) => {
        if (exn instanceof Error) {
          return exn.stack;
        } else {
          return null;
        }
      },
      KB: (x0,x1) => x0.test(x1),
      KC: Function.prototype.call.bind(DataView.prototype.getFloat32),
      KD: (x0,x1) => x0.append(x1),
      KE: x0 => x0.preventDefault(),
      KF: (x0,x1) => x0.createEvent(x1),
      KG: x0 => x0.languages,
      KH: () => typeof dartUseDateNowForTicks !== "undefined",
      KI: (x0,x1) => { x0.disabled = x1 },
      KJ: x0 => x0.frameCount,
      KK: x0 => x0.userAgent,
      L: o => o === undefined,
      LB: (a, i, v) => a[i] = v,
      LC: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Float32Array) return 1;
        return 2;
      },
      LD: (x0,x1) => { x0.textContent = x1 },
      LE: (x0,x1) => x0.contains(x1),
      LF: (x0,x1,x2,x3) => x0.initEvent(x1,x2,x3),
      LG: (x0,x1) => x0.observe(x1),
      LH: () => Date.now(),
      LI: (a, i) => a.splice(i, 1),
      LJ: x0 => x0.selectedTrack,
      LK: x0 => x0.navigator,
      M: o => String(o),
      MB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmI8ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      MC: Function.prototype.call.bind(DataView.prototype.getUint32),
      MD: (ms, c) =>
      setTimeout(() => dartInstance.exports.$invokeCallback(c),ms),
      ME: (x0,x1) => x0.focus(x1),
      MF: () => globalThis.window,
      MG: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1) { return wasmFunction(f,arguments.length,x0,x1) }),
      MH: () => 1000 * performance.now(),
      MI: a => a.pop(),
      MJ: x0 => x0.completed,
      MK: (x0,x1,x2,x3) => x0.open(x1,x2,x3),
      N: (c) =>
      queueMicrotask(() => dartInstance.exports.$invokeCallback(c)),
      NB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmI32ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      NC: Function.prototype.call.bind(DataView.prototype.setUint32),
      ND: x0 => x0.parentElement,
      NE: (x0,x1) => x0.closest(x1),
      NF: x0 => x0.readText(),
      NG: x0 => new ResizeObserver(x0),
      NH: x0 => new Uint8Array(x0),
      NI: (map, o, v) => map.set(o, v),
      NJ: x0 => x0.ready,
      NK: x0 => x0.length,
      O: (x0,x1) => x0.didCreateEngineInitializer(x1),
      OB: Function.prototype.call.bind(String.prototype.toLowerCase),
      OC: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Uint32Array) return 1;
        return 2;
      },
      OD: (x0,x1) => x0.querySelectorAll(x1),
      OE: (x0,x1) => x0.getAttribute(x1),
      OF: x0 => x0.clipboard,
      OG: x0 => globalThis.parseFloat(x0),
      OH: (x0,x1,x2) => x0.slice(x1,x2),
      OI: (map, o) => map.get(o),
      OJ: x0 => x0.tracks,
      OK: x0 => x0.getReader(),
      P: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      PB: (o, p, r) => o.replaceAll(p, () => r),
      PC: Function.prototype.call.bind(DataView.prototype.getInt32),
      PD: x0 => x0.length,
      PE: x0 => x0.activeElement,
      PF: (x0,x1) => x0.writeText(x1),
      PG: (x0,x1) => x0.getComputedStyle(x1),
      PH: (x0,x1) => x0.decode(x1),
      PI: () => new WeakMap(),
      PJ: x0 => x0.close(),
      PK: x0 => x0.value,
      Q: (wasmFunction,f) => finalizeWrapper(f, function() { return wasmFunction(f,arguments.length) }),
      QB: x0 => x0.length,
      QC: Function.prototype.call.bind(DataView.prototype.setInt32),
      QD: (x0,x1) => x0.item(x1),
      QE: (x0,x1) => x0.add(x1),
      QF: x0 => x0.unlock(),
      QG: x0 => x0.documentElement,
      QH: (x0,x1) => x0.adoptText(x1),
      QI: (o, offsetInBytes, lengthInBytes) => {
        var dst = new ArrayBuffer(lengthInBytes);
        new Uint8Array(dst).set(new Uint8Array(o, offsetInBytes, lengthInBytes));
        return new DataView(dst);
      },
      QJ: (x0,x1) => ({frameIndex: x0,completeFramesOnly: x1}),
      QK: x0 => x0.done,
      R: (x0,x1) => ({initializeEngine: x0,autoStart: x1}),
      RB: x0 => x0.pop(),
      RC: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Int32Array) return 1;
        return 2;
      },
      RD: x0 => x0.userAgent,
      RE: x0 => x0.classList,
      RF: (x0,x1) => x0.lock(x1),
      RG: x0 => x0.computedStyleMap(),
      RH: x0 => x0.first(),
      RI: (a, s, e) => a.slice(s, e),
      RJ: (x0,x1) => x0.decode(x1),
      RK: x0 => x0.read(),
      S: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1) { return wasmFunction(f,arguments.length,x0,x1) }),
      SB: x0 => x0.flags,
      SC: o => o instanceof Uint16Array,
      SD: x0 => x0.maxTouchPoints,
      SE: x0 => x0.data,
      SF: x0 => x0.orientation,
      SG: (x0,x1) => x0.get(x1),
      SH: x0 => x0.next(),
      SI: (x0,x1) => x0.createElement(x1),
      SJ: x0 => x0.displayHeight,
      SK: x0 => x0.body,
      T: x0 => new Promise(x0),
      TB: s => s.trim(),
      TC: Function.prototype.call.bind(DataView.prototype.getUint16),
      TD: x0 => x0.platform,
      TE: x0 => x0.scrollTop,
      TF: (x0,x1) => x0.querySelector(x1),
      TG: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      TH: x0 => x0.current(),
      TI: (x0,x1) => x0.append(x1),
      TJ: x0 => x0.displayWidth,
      TK: (x0,x1) => new OffscreenCanvas(x0,x1),
      U: (x0,x1,x2) => x0.call(x1,x2),
      UB: (a, s) => a.join(s),
      UC: Function.prototype.call.bind(DataView.prototype.setUint16),
      UD: x0 => x0.navigator,
      UE: (handle) => clearTimeout(handle),
      UF: (x0,x1) => { x0.content = x1 },
      UG: x0 => x0.matches,
      UH: (x0,x1) => new Intl.v8BreakIterator(x0,x1),
      UI: (x0,x1,x2) => x0.insertRule(x1,x2),
      UJ: x0 => x0.duration,
      UK: x0 => x0.assetBase,
      V: (constructor, args) => {
        const factoryFunction = constructor.bind.apply(
            constructor, [null, ...args]);
        return new factoryFunction();
      },
      VB: x0 => x0.random(),
      VC: o => o instanceof Int16Array,
      VD: s => new Date(s * 1000).getTimezoneOffset() * 60,
      VE: (x0,x1) => { x0.scrollTop = x1 },
      VF: x0 => x0.head,
      VG: (x0,x1) => x0.matchMedia(x1),
      VH: x0 => x0.v8BreakIterator,
      VI: (x0,x1) => x0.add(x1),
      VJ: x0 => x0.image,
      VK: x0 => x0.loader,
      W: x0 => new Array(x0),
      WB: () => globalThis.Math,
      WC: Function.prototype.call.bind(DataView.prototype.getInt16),
      WD: Date.now,
      WE: x0 => x0.tagName,
      WF: (x0,x1) => { x0.name = x1 },
      WG: x0 => x0.matches,
      WH: () => globalThis.Intl,
      WI: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      WJ: () => globalThis.window.ImageDecoder,
      WK: () => globalThis._flutter,
      X: o => [o],
      XB: (x0,x1) => x0.error(x1),
      XC: Function.prototype.call.bind(DataView.prototype.setInt16),
      XD: (x0,x1,x2) => x0.setAttribute(x1,x2),
      XE: (x0,x1,x2) => x0.setSelectionRange(x1,x2),
      XF: (x0,x1) => { x0.title = x1 },
      XG: x0 => x0.timeStamp,
      XH: (x0,x1) => x0.segment(x1),
      XI: (x0,x1,x2) => x0.addEventListener(x1,x2),
      XJ: x0 => x0.decode(),
      Y: (o0, o1) => [o0, o1],
      YB: () => globalThis.console,
      YC: o => o instanceof Uint8ClampedArray,
      YD: (x0,x1,x2,x3) => x0.setProperty(x1,x2,x3),
      YE: (x0,x1) => { x0.value = x1 },
      YF: () => globalThis.document,
      YG: (x0,x1) => x0.hasAttribute(x1),
      YH: x0 => x0.index,
      YI: x0 => x0.preventDefault(),
      YJ: (x0,x1,x2,x3) => x0.open(x1,x2,x3),
      Z: (o0, o1, o2) => [o0, o1, o2],
      ZB: s => s.trimRight(),
      ZC: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Uint8Array) return 1;
        return 2;
      },
      ZD: x0 => x0.style,
      ZE: (x0,x1,x2) => x0.setSelectionRange(x1,x2),
      ZF: (x0,x1) => x0.vibrate(x1),
      ZG: x0 => x0.buttons,
      ZH: x0 => x0.next(),
      ZI: x0 => x0.createRange(),
      ZJ: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      a: (o0, o1, o2, o3) => [o0, o1, o2, o3],
      aB: (a, i) => a.push(i),
      aC: Function.prototype.call.bind(DataView.prototype.setInt8),
      aD: (x0,x1) => x0.createElement(x1),
      aE: (x0,x1) => { x0.value = x1 },
      aF: (o, p) => p in o,
      aG: x0 => x0.ctrlKey,
      aH: x0 => x0.value,
      aI: (x0,x1) => x0.selectNode(x1),
      aJ: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      b: (x0,x1,x2) => { x0[x1] = x2 },
      bB: (x0,x1,x2,x3) => x0.pushState(x1,x2,x3),
      bC: Function.prototype.call.bind(DataView.prototype.getInt8),
      bD: x0 => x0.body,
      bE: x0 => x0.relatedTarget,
      bF: x0 => x0.arrayBuffer(),
      bG: x0 => x0.y,
      bH: x0 => x0.done,
      bI: x0 => x0.getSelection(),
      bJ: x0 => x0.send(),
      c: o => o,
      cB: () => ({}),
      cC: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Int8Array) return 1;
        return 2;
      },
      cD: x0 => x0.remove(),
      cE: s => {
        if (/[[\]{}()*+?.\\^$|]/.test(s)) {
            s = s.replace(/[[\]{}()*+?.\\^$|]/g, '\\$&');
        }
        return s;
      },
      cF: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof ArrayBuffer) return 1;
        if (globalThis.SharedArrayBuffer !== undefined &&
            o instanceof SharedArrayBuffer) {
          return 2;
        }
        return 3;
      },
      cG: x0 => x0.x,
      cH: (o, m, a) => o[m].apply(o, a),
      cI: x0 => x0.removeAllRanges(),
      cJ: x0 => x0.status,
      d: (o, p) => o[p],
      dB: (o, p, v) => o[p] = v,
      dC: (o, start, length) => new Float64Array(o.buffer, o.byteOffset + start, length),
      dD: (x0,x1) => x0.getPropertyValue(x1),
      dE: x0 => x0.value,
      dF: x0 => x0.status,
      dG: x0 => x0.offsetTop,
      dH: x0 => x0.iterator,
      dI: (x0,x1) => x0.addRange(x1),
      dJ: x0 => x0.response,
      e: () => globalThis,
      eB: () => [],
      eC: (o, start, length) => new Float32Array(o.buffer, o.byteOffset + start, length),
      eD: (x0,x1) => x0.warn(x1),
      eE: x0 => x0.selectionDirection,
      eF: (x0,x1) => x0.fetch(x1),
      eG: x0 => x0.scrollLeft,
      eH: () => globalThis.Symbol,
      eI: () => globalThis.window,
      eJ: (x0,x1,x2) => x0.setRequestHeader(x1,x2),
      f: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      fB: b => !!b,
      fC: (o, start, length) => new Uint32Array(o.buffer, o.byteOffset + start, length),
      fD: x0 => x0.console,
      fE: x0 => x0.selectionStart,
      fF: x0 => x0.content,
      fG: x0 => x0.offsetLeft,
      fH: (x0,x1) => new Intl.Segmenter(x0,x1),
      fI: (x0,x1) => { x0.innerText = x1 },
      fJ: (x0,x1) => { x0.responseType = x1 },
      g: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      gB: x0 => new Int8Array(x0),
      gC: (o, start, length) => new Int32Array(o.buffer, o.byteOffset + start, length),
      gD: (x0,x1) => { x0.id = x1 },
      gE: x0 => x0.selectionEnd,
      gF: x0 => x0.document,
      gG: x0 => x0.offsetParent,
      gH: x0 => x0.Segmenter,
      gI: x0 => x0.offsetY,
      gJ: () => new XMLHttpRequest(),
      h: (x0,x1) => ({addView: x0,removeView: x1}),
      hB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmI8ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      hC: (o, start, length) => new Uint16Array(o.buffer, o.byteOffset + start, length),
      hD: (x0,x1) => x0.requestAnimationFrame(x1),
      hE: x0 => x0.value,
      hF: x0 => x0.language,
      hG: x0 => x0.deltaMode,
      hH: x0 => x0.buffer,
      hI: x0 => x0.offsetX,
      hJ: x0 => x0.input,
      i: (string, token) => string.split(token),
      iB: x0 => new Uint8Array(x0),
      iC: (o, start, length) => new Int16Array(o.buffer, o.byteOffset + start, length),
      iD: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      iE: x0 => x0.selectionDirection,
      iF: (x0,x1,x2,x3) => x0.register(x1,x2,x3),
      iG: x0 => x0.deltaY,
      iH: x0 => x0.wasmMemory,
      iI: x0 => x0.button,
      iJ: (o, p) => p in o,
      j: o => o instanceof Array,
      jB: x0 => new Uint8ClampedArray(x0),
      jC: (o, start, length) => new Uint8ClampedArray(o.buffer, o.byteOffset + start, length),
      jD: x0 => x0.now(),
      jE: x0 => x0.selectionStart,
      jF: (x0,x1) => x0.prepend(x1),
      jG: x0 => x0.deltaX,
      jH: () => globalThis.window._flutter_skwasmInstance,
      jI: x0 => x0.classList,
      jJ: x0 => x0.groups,
      k: (a, i) => a[i],
      kB: x0 => new Int16Array(x0),
      kC: (o, start, length) => new Int8Array(o.buffer, o.byteOffset + start, length),
      kD: x0 => x0.performance,
      kE: x0 => x0.selectionEnd,
      kF: (x0,x1,x2,x3) => x0.addEventListener(x1,x2,x3),
      kG: x0 => x0.wheelDeltaY,
      kH: () => new TextDecoder(),
      kI: (x0,x1) => { x0.height = x1 },
      kJ: () => globalThis.window.navigator.userAgent,
      l: a => a.length,
      lB: x0 => new Uint16Array(x0),
      lC: x0 => x0.history,
      lD: (x0,x1) => x0.unregister(x1),
      lE: x0 => x0.keyCode,
      lF: (x0,x1) => x0.querySelector(x1),
      lG: x0 => x0.wheelDeltaX,
      lH: Function.prototype.call.bind(DataView.prototype.setBigInt64),
      lI: (x0,x1) => { x0.width = x1 },
      lJ: x0 => x0.history,
      m: (string, times) => string.repeat(times),
      mB: x0 => new Int32Array(x0),
      mC: (x0,x1,x2,x3) => x0.replaceState(x1,x2,x3),
      mD: () => globalThis.window.FinalizationRegistry,
      mE: (x0,x1) => x0.scrollIntoView(x1),
      mF: (x0,x1) => x0.querySelectorAll(x1),
      mG: x0 => x0.key,
      mH: Function.prototype.call.bind(DataView.prototype.getBigInt64),
      mI: x0 => x0.style,
      mJ: () => globalThis.window,
      n: (decoder, codeUnits) => decoder.decode(codeUnits),
      nB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmI32ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      nC: o => {
        const proto = Object.getPrototypeOf(o);
        return proto === Object.prototype || proto === null;
      },
      nD: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      nE: x0 => x0.multiViewEnabled,
      nF: x0 => x0.tabIndex,
      nG: x0 => x0.identifier,
      nH: (o, start, length) => new BigInt64Array(o.buffer, o.byteOffset + start, length),
      nI: x0 => x0.sheet,
      nJ: x0 => x0.baseURI,
      o: (o, start, length) => new Uint8Array(o.buffer, o.byteOffset + start, length),
      oB: x0 => new Uint32Array(x0),
      oC: o => Object.keys(o),
      oD: x0 => new window.FinalizationRegistry(x0),
      oE: x0 => x0.parent,
      oF: x0 => x0.parentNode,
      oG: x0 => x0.touches,
      oH: x0 => x0.debugSkipFontRetryDelay,
      oI: x0 => x0.head,
      oJ: (x0,x1) => x0.transferFromImageBitmap(x1),
      p: () => new TextDecoder("utf-8", {fatal: true}),
      pB: x0 => new Float32Array(x0),
      pC: o => typeof o === 'function' && o[jsWrappedDartFunctionSymbol] === true,
      pD: x0 => x0.scale,
      pE: (x0,x1) => x0.replaceWith(x1),
      pF: x0 => x0.clientY,
      pG: x0 => x0.pressure,
      pH: (x0,x1,x2) => x0.set(x1,x2),
      pI: () => globalThis.document,
      pJ: (x0,x1) => x0.getContext(x1),
      q: () => new TextDecoder("utf-8", {fatal: false}),
      qB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmF32ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      qC: f => f.dartFunction,
      qD: x0 => x0.visualViewport,
      qE: (x0,x1) => { x0.type = x1 },
      qF: x0 => x0.clientX,
      qG: x0 => x0.tiltY,
      qH: x0 => x0.fontFallbackBaseUrl,
      qI: x0 => x0.naturalHeight,
      qJ: (x0,x1) => { x0.height = x1 },
      r: s => s.trimLeft(),
      rB: x0 => new Float64Array(x0),
      rC: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      rD: x0 => x0.devicePixelRatio,
      rE: (x0,x1) => { x0.className = x1 },
      rF: x0 => x0.getBoundingClientRect(),
      rG: x0 => x0.tiltX,
      rH: (handle) => clearInterval(handle),
      rI: x0 => x0.naturalWidth,
      rJ: (x0,x1) => { x0.width = x1 },
      s: (l, r) => l === r,
      sB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmF64ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      sC: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1) { return wasmFunction(f,arguments.length,x0,x1) }),
      sD: (d, digits) => d.toFixed(digits),
      sE: (x0,x1) => { x0.tabIndex = x1 },
      sF: x0 => x0.bottom,
      sG: x0 => x0.pointerType,
      sH: (ms, c) =>
      setInterval(() => dartInstance.exports.$invokeCallback(c), ms),
      sI: (x0,x1) => { x0.pointerEvents = x1 },
      sJ: x0 => x0.height,
      t: (x0,x1) => x0[x1],
      tB: x0 => new ArrayBuffer(x0),
      tC: (p, s, f) => p.then(s, (e) => f(e, e === undefined)),
      tD: x0 => x0.maxHeight,
      tE: (x0,x1) => { x0.name = x1 },
      tF: x0 => x0.top,
      tG: x0 => x0.pointerId,
      tH: () => Date.now(),
      tI: (x0,x1) => { x0.src = x1 },
      tJ: x0 => x0.width,
      u: o => o,
      uB: (x0,x1,x2) => new Uint8Array(x0,x1,x2),
      uC: (o, i) => o[i],
      uD: x0 => x0.maxWidth,
      uE: (x0,x1) => { x0.placeholder = x1 },
      uF: x0 => x0.right,
      uG: x0 => x0.getCoalescedEvents(),
      uH: () => {
        return typeof process != "undefined" &&
               Object.prototype.toString.call(process) == "[object process]" &&
               process.platform == "win32"
      },
      uI: x0 => x0.src,
      uJ: x0 => x0.rasterEndMilliseconds,
      v: o => {
        if (o === undefined || o === null) return 0;
        if (typeof o === 'number') return 1;
        return 2;
      },
      vB: (x0,x1,x2) => new DataView(x0,x1,x2),
      vC: o => o.length,
      vD: x0 => x0.minHeight,
      vE: (x0,x1) => { x0.autocomplete = x1 },
      vF: x0 => x0.left,
      vG: (x0,x1) => x0.getModifierState(x1),
      vH: () => {
        // On browsers return `globalThis.location.href`
        if (globalThis.location != null) {
          return globalThis.location.href;
        }
        return null;
      },
      vI: (x0,x1) => x0.revokeObjectURL(x1),
      vJ: x0 => x0.rasterStartMilliseconds,
      w: x0 => x0.index,
      wB: (o, p) => o[p],
      wC: o => {
        if (o === undefined) return 1;
        var type = typeof o;
        if (type === 'boolean') return 2;
        if (type === 'number') return 3;
        if (type === 'string') return 4;
        if (o instanceof Array) return 5;
        if (ArrayBuffer.isView(o)) {
          if (o instanceof Int8Array) return 6;
          if (o instanceof Uint8Array) return 7;
          if (o instanceof Uint8ClampedArray) return 8;
          if (o instanceof Int16Array) return 9;
          if (o instanceof Uint16Array) return 10;
          if (o instanceof Int32Array) return 11;
          if (o instanceof Uint32Array) return 12;
          if (o instanceof Float32Array) return 13;
          if (o instanceof Float64Array) return 14;
          if (o instanceof DataView) return 15;
        }
        if (o instanceof ArrayBuffer) return 16;
        // Feature check for `SharedArrayBuffer` before doing a type-check.
        if (globalThis.SharedArrayBuffer !== undefined &&
            o instanceof SharedArrayBuffer) {
            return 17;
        }
        if (o instanceof Promise) return 18;
        return 19;
      },
      wD: x0 => x0.minWidth,
      wE: (x0,x1) => { x0.name = x1 },
      wF: x0 => x0.clientY,
      wG: x0 => x0.blur(),
      wH: x0 => new WeakRef(x0),
      wI: (x0,x1) => { x0.src = x1 },
      wJ: x0 => x0.imageBitmaps,
      x: (x0,x1) => x0.exec(x1),
      xB: (o) => new DataView(o.buffer, o.byteOffset, o.byteLength),
      xC: x0 => x0.state,
      xD: x0 => x0.height,
      xE: (x0,x1) => { x0.placeholder = x1 },
      xF: x0 => x0.clientX,
      xG: x0 => x0.button,
      xH: x0 => x0.deref(),
      xI: (x0,x1,x2,x3,x4) => globalThis.createImageBitmap(x0,x1,x2,x3,x4),
      xJ: x0 => x0.canvasKitMaximumSurfaces,
      y: (x0,x1) => { x0.lastIndex = x1 },
      yB: Function.prototype.call.bind(Object.getOwnPropertyDescriptor(DataView.prototype, 'byteLength').get),
      yC: (x0,x1,x2) => x0.removeEventListener(x1,x2),
      yD: x0 => x0.width,
      yE: (x0,x1) => { x0.action = x1 },
      yF: x0 => x0.changedTouches,
      yG: x0 => x0.innerHeight,
      yH: () => globalThis.WeakRef,
      yI: x0 => x0.naturalHeight,
      yJ: x0 => x0.nextSibling,
      z: (s, m) => {
        try {
          return new RegExp(s, m);
        } catch (e) {
          return String(e);
        }
      },
      zB: Function.prototype.call.bind(DataView.prototype.setFloat64),
      zC: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      zD: x0 => x0.screen,
      zE: (x0,x1) => { x0.method = x1 },
      zF: x0 => x0.offsetY,
      zG: x0 => x0.height,
      zH: (x0,x1,x2) => x0.insertBefore(x1,x2),
      zI: x0 => x0.naturalWidth,
      zJ: (x0,x1) => x0.debug(x1),

    };

    const baseImports = {
      _: dart2wasm,
      Math: Math,
      Date: Date,
      Object: Object,
      Array: Array,
      Reflect: Reflect,
      WebAssembly: {
        JSTag: WebAssembly.JSTag,
      },
      "": new Proxy({}, { get(_, prop) { return prop; } }),

    };

    const jsStringPolyfill = {
      "charCodeAt": (s, i) => s.charCodeAt(i),
      "compare": (s1, s2) => {
        if (s1 < s2) return -1;
        if (s1 > s2) return 1;
        return 0;
      },
      "concat": (s1, s2) => s1 + s2,
      "equals": (s1, s2) => s1 === s2,
      "fromCharCode": (i) => String.fromCharCode(i),
      "length": (s) => s.length,
      "substring": (s, a, b) => s.substring(a, b),
      "fromCharCodeArray": (a, start, end) => {
        if (end <= start) return '';

        const read = dartInstance.exports.$wasmI16ArrayGet;
        let result = '';
        let index = start;
        const chunkLength = Math.min(end - index, 500);
        let array = new Array(chunkLength);
        while (index < end) {
          const newChunkLength = Math.min(end - index, 500);
          for (let i = 0; i < newChunkLength; i++) {
            array[i] = read(a, index++);
          }
          if (newChunkLength < chunkLength) {
            array = array.slice(0, newChunkLength);
          }
          result += String.fromCharCode(...array);
        }
        return result;
      },
      "intoCharCodeArray": (s, a, start) => {
        if (s === '') return 0;

        const write = dartInstance.exports.$wasmI16ArraySet;
        for (var i = 0; i < s.length; ++i) {
          write(a, start++, s.charCodeAt(i));
        }
        return s.length;
      },
      "test": (s) => typeof s == "string",
    };


    

    dartInstance = await WebAssembly.instantiate(this.module, {
      ...baseImports,
      ...additionalImports,
      
      "wasm:js-string": jsStringPolyfill,
    });

    return new InstantiatedApp(this, dartInstance);
  }
}

class InstantiatedApp {
  constructor(compiledApp, instantiatedModule) {
    this.compiledApp = compiledApp;
    this.instantiatedModule = instantiatedModule;
  }

  // Call the main function with the given arguments.
  invokeMain(...args) {
    this.instantiatedModule.exports.$invokeMain(args);
  }
}
