let theme = 'light';
let selectors = "h1, h2, h3, h4, h5, h6, p, li, span, a, i, code, .main-content";
let originalBgColor;

document.addEventListener('DOMContentLoaded', () => {
  originalBgColor = document.body.style.backgroundColor;

  // TODO use CSS queries instead of JS
  let prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches
  if (localStorage.getItem("theme") !== 'light' && prefersDark) {
    toggleTheme();
  }

  document.querySelector("#color-scheme").addEventListener("click", toggleTheme);
  document.querySelector("#hamburger").addEventListener("click", toggleMenu);
});

function toggleTheme() {
  if (theme === 'light') {
    theme = 'dark';
    document.body.style.backgroundColor = 'rgb(50, 50, 50)'
    document.querySelectorAll(selectors)
      .forEach((el) => {
        if (!el.closest("code.multiline")) {
          el.classList.add("dark")
        }
      });
    localStorage.setItem("theme", theme);
  } else {
    theme = 'light';
    document.body.style.backgroundColor = originalBgColor;
    document.querySelectorAll(selectors)
      .forEach((el) => {
        if (!el.closest("code.multiline")) {
          el.classList.remove("dark")
        }
      });
    localStorage.setItem("theme", theme);
  }
}

function toggleMenu() {
  document.querySelectorAll("header .header-list, .hamburger")
    .forEach((el) => el.classList.toggle("open"));
  document.querySelectorAll(".main-content, .header-logo")
    .forEach((el) => el.classList.toggle("hidden"));
}

