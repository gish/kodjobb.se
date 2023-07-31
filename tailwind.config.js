const colors = require("tailwindcss/colors");

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {
      colors: {
        primary: colors.stone[50],
        secondary: colors.amber[100],
        accent: colors.sky,
      },
    },
  },
  plugins: [],
};
