import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed ('#banner-typed-text', {
  strings: ["any kind of movies","love", "the world", "the civilians"],
  typeSpeed: 150,
  loop:true
});
}


export { loadDynamicBannerText };
