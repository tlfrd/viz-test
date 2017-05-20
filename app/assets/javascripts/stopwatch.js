StopWatch = function() {
  this.StartMilliseconds = 0;
  this.ElapsedMilliseconds = 0;
}

StopWatch.prototype.Start = function() {
  this.StartMilliseconds = new Date().getTime();
}

StopWatch.prototype.Stop = function() {
  this.ElapsedMilliseconds = new Date().getTime() - this.StartMilliseconds;
}
