function palindrome(str) {

    //make our own locally scoped variable
    let compareString = str;

    //replace spaces first, 
    //then non-alphanumeric characters, 
    //then make all characters lowercase

    compareString = compareString.replace(/\s+/g, "");
    compareString = compareString.replace(/[.,\/#!$%\^&\*;:{}=\-_`~()]/g,"");
    compareString = compareString.toLowerCase();

    //only need to go to half the length of the string since a palindrome is itself backwards
    for(let i = 0; i < compareString.length / 2 ; i++){
        if(compareString[i] != compareString[compareString.length - i - 1])
            return false;
  }
  
  return true;
}

palindrome("eye");