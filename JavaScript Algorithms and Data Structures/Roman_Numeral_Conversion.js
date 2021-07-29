function convertToRoman(num) {
  let numerals = {
    M: 1000,
    CM: 900,
    D: 500,
    CD: 400,
    C: 100,
    XC: 90,
    L: 50,
    XL: 40,
    X: 10,
    IX: 9,
    V: 5,
    IV: 4,
    I: 1,
  };
  let romanNum = "";

  for (let i in numerals) {
    while (num >= numerals[i]) {
      romanNum += i;
      num -= numerals[i];
    }
  }

  return romanNum;
}
