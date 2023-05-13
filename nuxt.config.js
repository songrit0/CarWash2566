export default {
  server: {
    host: "0.0.0.0", // default: localhost
    // hostname: "quest.localhost",
    port: 2455, // default: 3000
  },
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: "Repair-Notification-System",
    htmlAttrs: {
      lang: "en",
    },
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      { hid: "description", name: "description", content: "" },
      { name: "format-detection", content: "telephone=no" },
    ],
    link: [
      { rel: "icon", type: "image/x-icon", href: "/favicon.ico" },
      {
        rel: "stylesheet",
        href: "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",
        integrity:
          "sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3",
        crossorigin: "anonymous",
      },
    ],
    script: [
      {
        type: "text/javascript",
        src: "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js",
        integrity:
          "sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p",
        crossorigin: "anonymous",
      },
      {
        type: "text/javascript",
        src: "https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js",
        integrity:
          "sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB",
        crossorigin: "anonymous",
      },
      {
        type: "text/javascript",
        src: "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js",
        integrity:
          "sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13",
        crossorigin: "anonymous",
      },
    ],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    '@/plugins/main.js'
    // '~/plugins/mosha-vue-toastify.js'
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [],

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {},
};
