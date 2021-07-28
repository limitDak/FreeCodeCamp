function telephoneCheck(str) {
  //first validate if string is within correct length range
  if (str.length < 10 || str.length > 16) return false;

  const regex = /^1? ?(( ?\d{3}[- ]*)|(\( ?\d{3}[- ]*\) *))\d{3}[- ]?\d{4}$/;

  return regex.test(str);
}
