<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru-Ru">
<head>
  <meta name="viewport" content="initial-scale=1.0" />
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
  <style> *{ margin: 0; border: 0; padding: 0; outline: 0; box-sizing: border-box; }
  html, body {
    background-size: cover;
    background: linear-gradient(180deg, rgba(255,255,255,1) 19%, rgba(34,29,253,1) 47%, rgba(255,0,0,1) 98%);
    font-family: "Fira", serif;
    height: calc(100% - 1px);
  }
  form {
    width: 100%;
    margin-bottom: 2%;
  }
  form {
    width: 100%;
    margin-bottom: 2%;
  }

  select {
    padding: 2px;
    border-radius: 4px;
    border: solid 1px black;
  }

  a:link {
    color: #00ffe9;
    background-color: transparent;
    text-decoration: none;
  }

  a:visited {
    color: #e289ff;
    background-color: transparent;
    text-decoration: none;
  }

  a:hover {
    color: #ff8484;
    background-color: transparent;
    text-decoration: underline;
  }

  a:active {
    color: #ffff78;
    background-color: transparent;
    text-decoration: underline;
  }

  input[type=button], input[type=submit], input[type=reset], button {
    background-color: #ffffff;
    border: solid 1px black;
    border-radius: 4px;
    color: black;
    text-decoration: none;
    padding: 2px 6px;
    cursor: pointer;
  }

  input[type=text] {
    padding: 2px;
    width: fit-content;
    background-color: #d7d7d7;
    border: solid 1px black;
    border-radius: 2px;
  }

  /* This is our style for the invalid fields */
  input.invalid {
    border-color: #900;
    background-color: #fdd;
  }

  input:focus.invalid {
    outline: none;
  }

  p {
    margin: 0.5em;
  }

  table {
    border: solid 2px black;
    border-collapse: collapse;
  }

  th, td {
    border: solid 1px black;
    padding: 5px;
  }

  .margin {
    margin: 2px;
  }

  /* This is the style of our error messages */
  .error {
    width: 100%;
    padding: 0;

    font-size: 80%;
    color: white;
    background-color: #900;
    overflow: auto;
    white-space: nowrap;

    border-radius: 5px;
  }

  .error.active {
    padding: 0.3em;
    margin: 1px 0 0;
  }

  .select-container {
    margin-left: 0.5em;
    display: flex;
    overflow: auto;
    flex-wrap: wrap;
    gap: 10px;
    padding: 0 4px;
    justify-content: space-between;
  }

  .select-input-container {
    width: min-content;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-end;
  }

  .select-radio-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    overflow: auto;
    gap: 2px;
  }



  input[type=button] {
    transition: color 0.3s, background-color 0.3s;
    background-color: white;
  }

  input[type=button].selected {
    color: #00ffe9;
    background-color: #268078;
  }

  .round-container {
    border: solid 2px black;
    border-radius: 4px;
  }

  .blured-container {
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
  }

  .fit-content-container {
    width: fit-content;
    height: fit-content;
  }

  #container {
    height: 100%;
    display: flex;
    flex-direction: column;
  }



  #main {
    display: flex;
    flex-wrap: wrap;
    flex: 1;
    overflow: auto;
    align-content: flex-start;
  }

  #choose {
    float: left;
    width: fit-content;
    background-color: #d5d5d570;
    height: fit-content;
    color: black;
  }

  #clear-table-container {
    margin-bottom: 2%;
  }

  #submit-container {
    padding: 0 4px;
    display: flex;
    justify-content: right;
  }

  #graph-container {
    display: flex;
    height: fit-content;
    width: fit-content;
  }

  #graph {
    width: 500px;
    height: 500px;
    padding: 2px;
  }

  #result-table-container {
    padding: 2px;
    width: fit-content;
    height: fit-content;
    float: right;
    clear: both;
    margin-top: 10px;
  }
  #header {
    padding: 5px;
    box-shadow: 0 -20px 100px black;
    overflow: auto;

    font-family: monospace;
    color: #2f2f2f;
    font-size: 16px;

    height: fit-content;
    background-color: rgba(255, 235, 205, 0.2);
  }
  </style>
  <title>web2</title>
</head>
  <body>
    <div id="container" class="margin">
      <div id="header" class="blured-container round-container margin">
        <p>Web Second Lab</p>
        <p>Сидоров Иван Олегович, группа P3225</p>
        <p>Вариант 861201</p>
      </div>
      <div id="main" class="margin">
        <div id="choose" class="blured-container round-container margin">
          <p>Введите значения:</p>
          <p>Каждое поле должно быть заполнено</p>
          <form action="${pageContext.request.contextPath}/controller" method="get">
            <div id="x-select-container" class="select-container margin">
              <label for="x-select">Введите X:</label>
              <div id="x-select-input" class="select-input-container">
                <input type="text" name="x-select" id="x-select" class="input-select"
                       placeholder="В диапазоне [-5; 5]" required />
                <span class="error" aria-live="polite"></span>
              </div>
            </div>
            <div id="y-select-container" class="select-container margin">
              <label for="y-select-input">Выберите Y:</label>
              <div class="select-input-container">
                <div id="y-select-input" class="select-radio-container">
                  <input type="button" name="y-select" value="-4"/>
                  <input type="button" name="y-select" value="-3"/>
                  <input type="button" name="y-select" value="-2"/>
                  <input type="button" name="y-select" value="-1"/>
                  <input type="button" name="y-select" value="0"/>
                  <input type="button" name="y-select" value="1"/>
                  <input type="button" name="y-select" value="2"/>
                  <input type="button" name="y-select" value="3"/>
                  <input type="button" name="y-select" value="4"/>
                </div>
                <span id="y-select-error" class="error" aria-live="polite"></span>
              </div>
            </div>
            <div id="r-select-container" class="select-container margin">
              <label for="r-select-input">Выберите R:</label>
              <div class="select-input-container">
                <div id="r-select-input" class="select-radio-container">
                  <input type="button" name="r-select" value="1"/>
                  <input type="button" name="r-select" value="1.5"/>
                  <input type="button" name="r-select" value="2"/>
                  <input type="button" name="r-select" value="2.5"/>
                  <input type="button" name="r-select" value="3"/>
                </div>
                <span id="r-select-error" class="error" aria-live="polite"></span>
              </div>
            </div>
            <div id="submit-container" class="margin">
              <input type="submit" id="submit-button" value="Подтвердить">
            </div>
          </form>
        </div>
        <div id="graph-container" class="blured-container round-container margin">
          <canvas id="graph" width="500px" height="500px"></canvas>
        </div>
        <div id="result-table-container" class="blured-container margin">
          <table id="result-table">
            <thead>
              <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th>Результат</th>
                <th>Текущее время</th>
                <th>Выполнено за, нс</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="result" items="${resultList}">
              <tr>
                <td>${result.x}</td>
                <td>${result.y}</td>
                <td>${result.r}</td>
                <td>${result.result ? 'Попадание' : 'Промах'}</td>
                <td>${result.calculatedAt}</td>
                <td>${result.calculationTime}</td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <script>const ctx = "${pageContext.request.contextPath}";</script>
    <script src="scripts/fix-placeholder.js"></script>
    <script src="scripts/get-intersection.js"></script>
    <script src="scripts/graph.js"></script>
    <script src="scripts/validation.js"></script>
    <script type="text/javascript">
      var resultList = [];

      <c:forEach var="result" items="${resultList}">
      var item = {
        x: ${result.x},
        y: ${result.y},
        r: ${result.r},
        result: ${result.result},
        calculationTime: ${result.calculationTime},
        calculatedAt: "${result.calculatedAt}"
      };
      resultList.push(item);
      drawPoint(${result.x}, ${result.y}, ${result.result});
      </c:forEach>
    </script>
  </body>
</html>