document.addEventListener("DOMContentLoaded", function () {
  const tableTranslations = {
    attendance: "Посещаемость",
    cars: "Автомобили",
    contracts: "Договоры",
    courses: "Курсы",
    exams: "Экзамены",
    status: "Статусы",
    students: "Студенты",
    teachers: "Преподаватели",
    users: "Пользователи",
  };

  fetch("get_tables.php")
    .then((response) => response.json())
    .then((data) => {
      const tableSelect = document.getElementById("tableSelect");
      data.forEach((table) => {
        const option = document.createElement("option");
        option.value = table;
        option.textContent = tableTranslations[table] || table;
        tableSelect.appendChild(option);
      });
    })
    .catch((error) => console.error("Error:", error));

  document
    .getElementById("exportButton")
    .addEventListener("click", function () {
      const selectedTable = document.getElementById("tableSelect").value;
      fetch(`export_data.php?table=${selectedTable}`)
        .then((response) => response.json())
        .then((data) => {
          const blob = new Blob([JSON.stringify(data)], {
            type: "application/json",
          });
          const link = document.createElement("a");
          link.href = URL.createObjectURL(blob);
          link.download = `${selectedTable}_export.json`;
          link.click();
        })
        .catch((error) => console.error("Error:", error));
    });
});

function importData() {
  let fileInput = document.querySelector('input[name="file"]');
  let file = fileInput.files[0];

  if (file) {
    let formData = new FormData();
    formData.append("file", file);

    fetch("import.php", {
      method: "POST",
      body: formData,
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          displayTable(data.table);
        } else {
          alert(data.error);
        }
      })
      .catch((error) => console.error("Error:", error));
  }
}

function cancelImport() {
  document.getElementById("dataTable").innerHTML = "";
  document.getElementById("importForm").reset();
}

function displayTable(table) {
  let tableHTML =
    '<table class="table-auto w-full border border-collapse border-gray-400 mt-4">';
  tableHTML += "<thead>";
  tableHTML += "<tr>";
  tableHTML += '<th class="border p-2">Фамилия</th>';
  tableHTML += '<th class="border p-2">Имя</th>';
  tableHTML += '<th class="border p-2">Отчество</th>';
  tableHTML += '<th class="border p-2">Номер</th>';
  tableHTML += '<th class="border p-2">Почта</th>';
  tableHTML += '<th class="border p-2">Логин</th>';
  tableHTML += '<th class="border p-2">Пароль</th>';
  tableHTML += "</tr>";
  tableHTML += "</thead>";
  tableHTML += "<tbody>";

  table.forEach((row) => {
    tableHTML += "<tr>";
    tableHTML += `<td class="border p-2">${row.lastname}</td>`;
    tableHTML += `<td class="border p-2">${row.name}</td>`;
    tableHTML += `<td class="border p-2">${row.patronymic}</td>`;
    tableHTML += `<td class="border p-2">${row.phone}</td>`;
    tableHTML += `<td class="border p-2">${row.email}</td>`;
    tableHTML += `<td class="border p-2">${row.username}</td>`;
    tableHTML += `<td class="border p-2">${row.password}</td>`;
    tableHTML += "</tr>";
  });

  tableHTML += "</tbody>";
  tableHTML += "</table>";

  document.getElementById("dataTable").innerHTML = tableHTML;
}
