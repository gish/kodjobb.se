const colors = require("tailwindcss/colors");

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {
      colors: {
        primary: "#f7fff7",
        secondary: "#11270b",
        accent: "#3f88c5",
      },
    },
  },
  plugins: [],
};
