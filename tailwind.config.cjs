/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.res.mjs'],
  theme: {
    extend: {
      aspectRatio: {
        '5/7': '5 / 7',
      },
      colors: {
        cardBlack: '#31373d',
        cardRed: '#be1931',
      },
      fontFamily: {
        cutive: 'Cutive, serif',
      },
    },
  },
  plugins: [],
};
