/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.res.mjs'],
  theme: {
    extend: {
      aspectRatio: {
        '9/16': '9 / 16',
      },
      backgroundImage: {
        cardback: 'url(/cardback.jpg)',
      },
      boxShadow: {
        rules: '0 0 100px 70px #2f2d36',
      },
      colors: {
        cardBlack: '#2f2d36',
        cardRed: '#ca563d',
      },
      fontFamily: {
        cutive: 'Cutive, serif',
      },
      rotate: {
        70: '70deg',
        110: '110deg',
      },
    },
  },
  plugins: [],
};
