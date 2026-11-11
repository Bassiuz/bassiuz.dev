// Motion for basdevaan.nl/new3. The page reads fine without this file: every hidden start state in site.css sits behind the `js` class.
const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;
const fine = matchMedia('(hover: hover) and (pointer: fine)').matches;
const $ = (s, r = document) => r.querySelector(s);
const $$ = (s, r = document) => [...r.querySelectorAll(s)];
const clamp = (v, a = 0, b = 1) => Math.min(b, Math.max(a, v));
// Delays that ease out: the gaps shrink, so a group lands as one wave instead of a metronome.
const wave = (i, n, spread) => (n < 2 ? 0 : Math.round(spread * (1 - (1 - i / (n - 1)) ** 1.6)));

// ---------- headings that resolve out of noise ----------
const NOISE = '01<>/\\_#%&*+=-';
function decode(el) {
  const span = el.firstElementChild, text = el.getAttribute('aria-label');
  if (reduced) return;
  const total = Math.min(1000, 320 + text.length * 34), t0 = performance.now();
  let last = 0;
  const tick = (t) => {
    const p = clamp((t - t0) / total);
    if (p === 1) { span.textContent = text; return; }
    // New noise every 40ms, not every frame: slower flicker reads as decoding, faster reads as static.
    if (t - last > 40) {
      last = t;
      const done = Math.floor(p * text.length);
      span.textContent = text.slice(0, done) + [...text.slice(done)].map((c) => (c === ' ' ? ' ' : NOISE[(Math.random() * NOISE.length) | 0])).join('');
    }
    requestAnimationFrame(tick);
  };
  requestAnimationFrame(tick);
}

// ---------- entrances: once, as each piece comes into view ----------
for (const parent of new Set($$('.reveal').map((el) => el.parentElement))) {
  const group = $$(':scope > .reveal', parent);
  group.forEach((el, i) => el.style.setProperty('--d', `${wave(i, group.length, Math.min(260, group.length * 80))}ms`));
}
const entering = $$('.reveal, .clip, .frame, [data-decode], [data-rise]');
const enter = (el) => { el.classList.add('in'); if (el.matches('[data-decode]')) decode(el); };
if (reduced) entering.forEach(enter);
else {
  const io = new IntersectionObserver((entries) => {
    for (const e of entries) if (e.isIntersecting) { enter(e.target); io.unobserve(e.target); }
  }, { rootMargin: '0px 0px -10% 0px' });
  entering.forEach((el) => io.observe(el));
}

// ---------- the line that types itself: the same texts and timing as the Flutter banner ----------
const typed = $('[data-type]');
if (typed && !reduced) {
  const texts = JSON.parse(typed.dataset.type);
  let current = typed.textContent, next = current;
  const step = () => {
    if (current === next) {
      next = texts[(Math.random() * texts.length) | 0];
      return setTimeout(step, 4000);
    }
    current = next.startsWith(current) ? next.slice(0, current.length + 1) : current.slice(0, -1);
    typed.textContent = current;
    setTimeout(step, 100);
  };
  step();
}

// ---------- the name that is also an email address ----------
const name = $('[data-name]');
if (name) {
  // Each swapped letter and the ".nl" get their real widths, in em so they survive a resize.
  const measure = () => {
    const em = parseFloat(getComputedStyle(name).fontSize);
    for (const s of $$('.swap', name)) {
      s.style.setProperty('--wa', `${$('.a', s).getBoundingClientRect().width / em}em`);
      s.style.setProperty('--wb', `${$('.b', s).getBoundingClientRect().width / em}em`);
    }
    $('.tld', name).style.setProperty('--wt', `${$('.tld span', name).getBoundingClientRect().width / em}em`);
    name.classList.add('measured');
  };
  document.fonts.ready.then(measure);
  let touched = false;
  const set = (on) => name.classList.toggle('is-mail', on);
  for (const el of $$('[data-mail-trigger]')) {
    el.addEventListener('pointerenter', () => { touched = true; set(true); });
    el.addEventListener('pointerleave', () => set(false));
    el.addEventListener('focus', () => { touched = true; set(true); });
    el.addEventListener('blur', () => set(false));
  }
  // Shown once on its own, after the entrance has settled, unless the visitor got there first.
  if (!reduced) setTimeout(() => { if (touched || scrollY > innerHeight / 3) return; set(true); setTimeout(() => { if (!touched) set(false); }, 2400); }, 2600);
}

// ---------- everything tied to scroll position, one frame at a time ----------
const bar = $('[data-bar]');
const progress = $('[data-progress]');
const parallax = reduced ? [] : $$('[data-parallax]').map((el) => ({ el, img: $('img', el), f: +el.dataset.parallax }));
const drift = reduced ? null : $('[data-drift]');
// How far an element has travelled through the viewport: 0 as its top meets the bottom edge, 1 as its bottom leaves the top edge.
const through = (r) => clamp((innerHeight - r.top) / (innerHeight + r.height));
let lastY = scrollY, queued = false;
function frame() {
  queued = false;
  const y = scrollY;
  if (progress) progress.style.transform = `scaleX(${clamp(y / Math.max(1, document.documentElement.scrollHeight - innerHeight))})`;
  if (bar) {
    if (y > lastY && y > 240) bar.classList.add('away');
    else if (y < lastY) bar.classList.remove('away');
  }
  lastY = y;
  for (const { el, img, f } of parallax) {
    const r = el.getBoundingClientRect();
    if (r.bottom < 0 || r.top > innerHeight) continue;
    img.style.transform = `translate3d(0, ${((through(r) - 0.5) * -2 * f * 100).toFixed(2)}%, 0) scale(${1 + 2 * f})`;
  }
  if (drift) {
    const r = drift.parentElement.getBoundingClientRect();
    if (r.bottom > 0 && r.top < innerHeight) {
      const room = Math.max(0, drift.scrollWidth - drift.parentElement.clientWidth);
      drift.style.transform = `translate3d(${(-through(r) * room).toFixed(1)}px, 0, 0)`;
    }
  }
}
const queue = () => { if (!queued) { queued = true; requestAnimationFrame(frame); } };
addEventListener('scroll', queue, { passive: true });
addEventListener('resize', queue);
frame();

// ---------- pointer: a glow that trails the cursor, cards that lean towards it ----------
if (fine && !reduced) {
  const glow = $('[data-glow]');
  let x = innerWidth / 2, y = innerHeight / 2, tx = x, ty = y, raf = 0;
  const loop = () => {
    x += (tx - x) * 0.1;
    y += (ty - y) * 0.1;
    glow.style.transform = `translate3d(${x.toFixed(1)}px, ${y.toFixed(1)}px, 0)`;
    raf = Math.abs(tx - x) + Math.abs(ty - y) > 0.5 ? requestAnimationFrame(loop) : 0;
  };
  addEventListener('pointermove', (e) => {
    tx = e.clientX; ty = e.clientY;
    glow.classList.add('on');
    if (!raf) raf = requestAnimationFrame(loop);
  }, { passive: true });
  document.documentElement.addEventListener('pointerleave', () => glow.classList.remove('on'));

  for (const card of $$('.tilt, .social-tile')) {
    const tilts = card.classList.contains('tilt');
    card.addEventListener('pointermove', (e) => {
      const r = card.getBoundingClientRect(), px = (e.clientX - r.left) / r.width, py = (e.clientY - r.top) / r.height;
      card.style.setProperty('--mx', `${(px * 100).toFixed(1)}%`);
      card.style.setProperty('--my', `${(py * 100).toFixed(1)}%`);
      if (tilts) card.style.transform = `rotateX(${((0.5 - py) * 7).toFixed(2)}deg) rotateY(${((px - 0.5) * 7).toFixed(2)}deg) translateZ(8px)`;
    });
    card.addEventListener('pointerleave', () => { card.style.transform = ''; });
  }
}
