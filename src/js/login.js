document.addEventListener("DOMContentLoaded", function () {
  const form = document.querySelector("form");

  form.addEventListener("submit", function (event) {
    event.preventDefault();

    const formData = new FormData(form);

    let data = {
      username: document.getElementsByName("username")[0].value,
    };

    console.log(data);

    fetch("./php/login.php", {
      method: "POST",
      body: formData,
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.status === "success") {
          alert(data.message);
          console.log(data);
          if (data.username != "admin") {
            window.location.href = "./index.html";
          } else {
            window.location.href = "./admin/index.php";
          }
        } else {
          alert(data.message);
        }
      })
      .catch((error) => console.error("Error:", error));
  });
});
