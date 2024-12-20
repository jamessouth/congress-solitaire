/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.res.mjs'],
  theme: {
    extend: {
      aspectRatio: {
        '9/16': '9 / 16',
      },
      backgroundImage: {
        bg: 'url(/bg.jpg)',
        cardback: 'url(/cardback.jpg)',
      },
      boxShadow: {
        card: '0px 0px 7px 7px #ca563d',
      },
      colors: {
        cardBlack: '#2f2d36',
        cardRed: '#ca563d',
        cardWhite: '#e2e2d6',
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
