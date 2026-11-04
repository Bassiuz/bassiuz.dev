// Entrances, the chapter-coloured bar and the Fluid UI slider. The page works without this file.
const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;

// Parts of each section rise in turn, once, as the section enters.
const io = new IntersectionObserver((entries) => {
  for (const e of entries) if (e.isIntersecting) { e.target.classList.add('in'); io.unobserve(e.target); }
}, { rootMargin: '0px 0px -8% 0px' });
document.querySelectorAll('main > *, .post-row').forEach((section) => {
  section.querySelectorAll('.reveal').forEach((el, i) => el.style.setProperty('--d', `${Math.min(i, 6) * 75}ms`));
});
document.querySelectorAll('.reveal').forEach((el) => (reduced ? el.classList.add('in') : io.observe(el)));

// The bar takes the ink of the chapter under it.
const bar = document.querySelector('[data-bar]');
const chapters = [...document.querySelectorAll('[data-chapter], .hero')];
function paintBar() {
  const y = bar.getBoundingClientRect().height / 2;
  let dark = false;
  for (const c of chapters) {
    const r = c.getBoundingClientRect();
    if (r.top <= y && r.bottom > y) {
      // the hero is paper above its seam and olive below it
      dark = c.classList.contains('hero') ? y > r.top + r.height * (innerWidth <= 640 ? 0.46 : 0.5) : c.dataset.chapter === 'dark';
    }
  }
  bar.classList.toggle('on-dark', dark);
}
addEventListener('scroll', paintBar, { passive: true });
addEventListener('resize', paintBar);
paintBar();

// Fluid UI: the same formula and settings as the Flutter site (displayLarge = step 9).
// min 10px × 1.15^9 at 320px wide, max 12px × 1.25^9 at 1200px, linear in between.
const range = document.getElementById('fluid-width');
if (range) {
  const min = 10 * 1.15 ** 9, max = 12 * 1.25 ** 9;
  const size = (w) => (w <= 320 ? min : w >= 1200 ? max : min + ((max - min) * (w - 320)) / (1200 - 320));
  const out = document.getElementById('fluid-width-out');
  const sample = document.querySelector('[data-fluid-sample]');
  const update = () => {
    const w = +range.value, px = size(w);
    out.textContent = `${w}px`;
    document.querySelector('[data-fluid-width]').textContent = w;
    document.querySelector('[data-fluid-size]').textContent = Math.round(px);
    sample.style.fontSize = `${px}px`;
  };
  range.value = Math.min(1200, Math.max(320, Math.round(innerWidth)));
  range.max = 1200;
  range.addEventListener('input', update);
  update();
}
