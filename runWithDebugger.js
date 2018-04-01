// ORIGINAL CODE
// function runWithDebugger(callback) {
//     debugger;
//     callback();
// }
// function sayHi() {
//    console.log('hi');
// }
// // BOTH SAME
// runWithDebugger(function sayHi() {
//     console.log('hi');
// });
// runWithDebugger(sayHi);

// BEAST MODE
function runWithDebugger(callback, optionalArray) {
    debugger;
    callback.apply(this, optionalArray);    // this is window because its called within a standard function but in this case no real point or could do callback.apply({}, optionalArray);
}

// function sayHiTo(name) {
//   console.log('hi ' + name);
// }
// runWithDebugger(sayHiTo, ['gordon']); // 'hi gordon'

// function sayFullName(first, last) {
//   console.log(first + ' '  + last);
// }
// runWithDebugger(sayFullName, ['gordon', 'zhu']); // 'gordon zhu'
