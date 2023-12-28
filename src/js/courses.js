document.addEventListener("DOMContentLoaded", function () {
  fetchCourses();
});

function fetchCourses() {
  fetch("./php/courses.php")
    .then((response) => response.json())
    .then((data) => {
      const coursesList = document.getElementById("coursesList");
      data.forEach((course) => {
        const card = createCourseCard(course);
        coursesList.appendChild(card);
      });
    })
    .catch((error) => console.error("Error:", error));
}

function createCourseCard(course) {
  const card = document.createElement("div");
  card.className =
    "bg-white p-6 rounded-lg shadow-md course-card cursor-pointer";

  const title = document.createElement("h2");
  title.className = "text-xl font-daysOne mb-2";
  title.textContent = course.title;

  const description = document.createElement("p");
  description.className = "text-gray-600 font-rubikR mb-4";
  description.textContent = course.description;

  const price = document.createElement("p");
  price.className = "text-green-600 font-daysOne";
  price.textContent = `Цена: ${course.price} руб.`;

  const teacher = document.createElement("p");
  teacher.className = "font-rubikR pt-2";
  teacher.textContent = `Преподаватель: ${course.teacherName}`;

  card.appendChild(title);
  card.appendChild(description);
  card.appendChild(price);
  card.appendChild(teacher);

  return card;
}
