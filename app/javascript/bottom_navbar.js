document.addEventListener("DOMContentLoaded", () => {
  // Select all navbar links
  const navbarLinks = document.querySelectorAll('.bottom_navbar__link');

  // Add event listener to each link
  navbarLinks.forEach(link => {
    link.addEventListener('click', (event) => {
      // Remove active class from all links
      navbarLinks.forEach(item => item.classList.remove('active'));
      // Add active class to the clicked link
      link.classList.add('active');
    });
  });
});
