<!-- overlay_js.php -->
<div class="overlay" id="overlay" aria-hidden="true"></div>

<script>
(function(){
  const btn = document.getElementById('btnHamb');
  const sidebar = document.getElementById('sidebar');
  const overlay = document.getElementById('overlay');

  if(!btn || !sidebar || !overlay) return;

  // ==========================
  // OPEN & CLOSE MENU (MOBILE)
  // ==========================
  function openMenu(){
    sidebar.classList.add('open');
    overlay.classList.add('show');
    btn.setAttribute('aria-expanded','true');
    sidebar.setAttribute('aria-hidden','false');
    overlay.setAttribute('aria-hidden','false');
    document.body.style.overflow = 'hidden';
  }

  function closeMenu(){
    sidebar.classList.remove('open');
    overlay.classList.remove('show');
    btn.setAttribute('aria-expanded','false');
    sidebar.setAttribute('aria-hidden','true');
    overlay.setAttribute('aria-hidden','true');
    document.body.style.overflow = '';
  }

  // ==========================
  // EVENT LISTENER
  // ==========================
  btn.addEventListener('click', () => {
    sidebar.classList.contains('open') ? closeMenu() : openMenu();
  });

  overlay.addEventListener('click', closeMenu);

  // ESC close
  document.addEventListener('keydown', (e) => {
    if(e.key === 'Escape' && sidebar.classList.contains('open')) closeMenu();
  });

  // ==========================
  // RESPONSIVE SYNC
  // ==========================
  function syncLayout(){
    if(window.innerWidth > 900){
      // DESKTOP MODE
      sidebar.classList.remove('open');
      overlay.classList.remove('show');

      sidebar.setAttribute('aria-hidden','false');
      overlay.setAttribute('aria-hidden','true');

      document.body.style.overflow = '';

    } else {
      // MOBILE MODE
      sidebar.setAttribute('aria-hidden','true');
      overlay.classList.remove('show');
    }
  }

  // Initial check
  syncLayout();

  // On resize
  window.addEventListener('resize', syncLayout);
})();
</script>
