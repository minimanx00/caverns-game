/// sleep_s(ms)
function sleep(ms = 20){
var t = current_time + ms;
while (current_time < t) { /* idle loop */ }
}