const VALID_CLASS_ID = "valid";
const INVALID_CLASS_ID = "invalid";
const ERROR_CLASS_ID = "error";
const ERROR_CLASS_ID_ACTIVATE = "error active";
const STRING_EMPTY = "";

const form = document.querySelector("form");
const x_select = document.getElementById("x-select");

const y_error = document.getElementById('y-select-error');
const x_error = x_select.nextElementSibling;
const r_error = document.getElementById('r-select-error');

function containsNumberAfterDecimal(inputString) {
    const regex = /\.0+([1-9])/;

    return regex.test(inputString);
}

window.addEventListener("load", () => {
    const isValidX = x_select.value.length === 0 || !Number.isNaN(+x_select.value);
    x_select.className = isValidX ? VALID_CLASS_ID : INVALID_CLASS_ID;
});


x_select.addEventListener("input", () => {
    const x = +x_select.value;


    const isValid = x_select.value.length === 0 || x_select.value === "-"
        || (!Number.isNaN(x) && x >= -5 && x <= 5)
        && !(x_select.value.includes("-5.") && containsNumberAfterDecimal(x_select.value))
        && !(x_select.value.includes("5.") && containsNumberAfterDecimal(x_select.value));
    if (isValid) {
        x_select.className = VALID_CLASS_ID;
        x_error.textContent = STRING_EMPTY;
        x_error.className = ERROR_CLASS_ID;
    } else {
        x_select.className = INVALID_CLASS_ID;
    }
});

const rButtons = document.querySelectorAll('input[name="r-select"]');

// Add event listener for each button
rButtons.forEach((button) => {
    button.addEventListener('click', function () {
        rButtons.forEach((btn) => {
            btn.classList.remove('selected');
        });

        // Select the clicked button
        this.classList.add('selected');

        // You can perform any actions you need with the selected value here
        const selectedValue = this.value;
        console.log(`Выбранное R: ${selectedValue}`);

        r_error.textContent = STRING_EMPTY;
        r_error.className = ERROR_CLASS_ID;

        // You can perform any actions you need with the selected value here
        drawShapesByR(+selectedValue);

    });
});

// Get all buttons with the name attribute "x-select"
const yButtons = document.querySelectorAll('input[name="y-select"]');

// Add a click event listener to each button
yButtons.forEach((button) => {
    button.addEventListener('click', function () {
        // Deselect all buttons
        yButtons.forEach((btn) => {
            btn.classList.remove('selected');
        });

        // Select the clicked button
        this.classList.add('selected');

        // You can perform any actions you need with the selected value here
        const selectedValue = this.value;
        console.log(`Выбранное Y: ${selectedValue}`);

        y_error.textContent = STRING_EMPTY;
        y_error.className = ERROR_CLASS_ID;
    });
});


// This defines what happens when the user tries to submit the data
form.addEventListener("submit", (event) => {
    const x = +x_select.value;

    // no default sending data to form (it will be done using xmlhttp if js is activated)
    event.preventDefault();

    const isValidX = x_select.value.length === 0 || !Number.isNaN(x);
    const isAcceptableX = x >= -5 && x <= 5
        && !(x_select.value.includes("-5.") && containsNumberAfterDecimal(x_select.value))
        && !(x_select.value.includes("5.") && containsNumberAfterDecimal(x_select.value));
    if (!isValidX) {
        x_select.className = INVALID_CLASS_ID;
        x_error.textContent = "Введите число";
        x_error.className = ERROR_CLASS_ID_ACTIVATE;
    } else if (!isAcceptableX) {
        x_select.className = INVALID_CLASS_ID;
        x_error.textContent = "Число должно быть в диапазоне от -5 до 5";
        x_error.className = ERROR_CLASS_ID_ACTIVATE;
    } else {
        x_select.className = VALID_CLASS_ID;
        x_error.textContent = STRING_EMPTY;
        x_error.className = ERROR_CLASS_ID;
    }

    let tempY;
    let tempIsSelectedY = false;

    yButtons.forEach((button) => {
        if (button.classList.contains('selected')) {
            tempIsSelectedY = true;
            tempY = button.value;
        }
    });

    const isSelectedY = tempIsSelectedY;
    if (!isSelectedY) {
        yButtons.forEach(async (b) => {
            b.style.backgroundColor = "rgba(255,51,51,0.97)";
            await new Promise(r => setTimeout(r, 300));
            b.style.backgroundColor = "";
        });

        y_error.textContent = "Выберите координату Y";
        y_error.className = ERROR_CLASS_ID_ACTIVATE;
    } else {
        y_error.textContent = STRING_EMPTY;
        y_error.className = ERROR_CLASS_ID;
    }

    const y = tempY;

    let tempR;
    let isSelectedR = false;

    rButtons.forEach(rb => {
        if (rb.classList.contains("selected")) {
            tempR = rb.value;
            isSelectedR = true;
        }
        else {
            r_error.textContent = "Выберите радиус R";
            r_error.className = ERROR_CLASS_ID_ACTIVATE;
        }
    });

    const r = tempR;

    if (isValidX && isAcceptableX && isSelectedY && isSelectedR) {
        send_intersection_rq(x, y, r);
    }
});