/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.res.mjs'],
  theme: {
    extend: {
      aspectRatio: {
        '5/7': '5 / 7',
      },
    },
  },
  plugins: [],
};
