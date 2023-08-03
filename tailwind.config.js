const colors = require("tailwindcss/colors");

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {
      colors: {
        primary: "#fefae0",
        secondary: "#dda15e",
        accent: "#283618",
      },
    },
  },
  plugins: [],
};
