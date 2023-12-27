document.getElementById("searchInput").addEventListener("input", function () {
  const searchValue = this.value.trim();
  const filterValue = document.getElementById("searchFilter").value;

  if (searchValue.length === 0) {
    document.getElementById("searchResults").innerHTML = "";
    return;
  }

  const xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      document.getElementById("searchResults").innerHTML = xhr.responseText;
    }
  };
  xhr.open(
    "GET",
    `search.php?query=${searchValue}&filter=${filterValue}`,
    true
  );
  xhr.send();
});
