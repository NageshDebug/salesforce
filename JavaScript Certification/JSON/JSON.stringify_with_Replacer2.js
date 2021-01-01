var unmaskedData = { "name": "Lokesh", "accountNumber": "3044444444", "city": "New York" };

var maskedData = JSON.stringify(unmaskedData, maskInfo);

function maskInfo(key, value) {
    var maskedValue = value;
    if (key == "accountNumber") {
        if (value && value.length > 5) {
            maskedValue = "*" + maskedValue.substring(value.length - 4, value.length);
        } else {
            maskedValue = "****";
        }
    }
    return maskedValue;
}

console.log(maskedData);