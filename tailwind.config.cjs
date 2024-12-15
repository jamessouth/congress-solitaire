/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.res.mjs'],
  theme: {
    extend: {
      aspectRatio: {
        '5/7': '5 / 7',
      },
      backgroundImage: {
        cardback: 'url(/cardback.jpg)',
      },
      boxShadow: {
        rules: '0 0 100px 70px #31373d',
      },
      colors: {
        cardBlack: '#31373d',
        cardRed: '#be1931',
      },
      fontFamily: {
        cutive: 'Cutive, serif',
      },
      rotate: {
        110: '110deg',
      },
    },
  },
  plugins: [],
};
