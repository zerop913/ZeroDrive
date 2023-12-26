/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {
      fontFamily: {
        daysOne: ["Days One", "regular"],
        rubikB: ["Rubik", "bold"],
        rubikR: ["Rubik", "regular"],
      },
      container: {
        padding: "122px",
        center: true,
      },
    },
  },
  plugins: [],
};
