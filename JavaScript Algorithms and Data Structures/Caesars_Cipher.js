function rot13(str) {
  let regExp = new RegExp("[A-Z]");
  let rot13 = "";

  for (let i = 0; i < str.length; i++) {
    if (regExp.test(str[i])) {
      if (str.charCodeAt(i) <= 77) {
        rot13 += String.fromCharCode(str.charCodeAt(i) + 13);
      } else {
        rot13 += String.fromCharCode(str.charCodeAt(i) - 13);
      }
    } else {
      rot13 += str[i];
    }
  }

  return rot13;
}
