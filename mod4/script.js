(function(){
var names = ["Yaakov", "John", "Jen", "Jason", "Paul", "Frank", "Larry", "Paula", "Laura", "Jim"];

for (name=0; name<names.length; name++) {
  if (names[name].charAt(0) == "J") {
       byeSpeaker.speak(names[name]);
  } else {
     helloSpeaker.speak(names[name]);
  }
}
})();