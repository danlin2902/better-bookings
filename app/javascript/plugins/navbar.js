const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-jacob');
  const searchbar = document.querySelector('.trip-search');
  if (navbar) {
    document.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-white');
        searchbar.classList.remove('trip-search');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        searchbar.classList.add('trip-search')
      }
    });
  }
}

const otherPages = () => {
  console.log("fuck me");
  const navbar = document.querySelector('.navbar-lewagon');
  const searchbar = document.querySelector('.trip-search');
  navbar.classList.add('navbar-lewagon-white');
  searchbar.classList.remove('trip-search');
};

export { otherPages };
export { initUpdateNavbarOnScroll};
