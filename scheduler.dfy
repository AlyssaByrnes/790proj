
//Simple Queue Code provided by https://www.microsoft.com/en-us/research/wp-content/uploads/2016/12/krml233.pdf figure 4
class {:autocontracts} SimpleQueue<Data>
{
ghost var Contents: seq<Data>;
var a: array<Data>;
var m: int, n: int;
predicate Valid()
{
(a != null) && (a.Length != 0) && (0 <= m <= n <= a.Length) && (Contents == a[m..n])
}

constructor ()
ensures Contents == [];
{
a, m, n, Contents := new Data[10], 0, 0, [];
}

method Enqueue(d: Data)
ensures Contents == old(Contents) + [d];
{
if n == a.Length {
var b := a;
if m == 0 { b := new Data[2 * a.Length]; }
forall (i | 0 <= i < n - m) {
b[i] := a[m + i];
}
a, m, n := b, 0, n - m;
}
a[n], n, Contents := d, n + 1, Contents + [d];
}

method Dequeue() returns (d: Data)
requires Contents != [];
ensures d == old(Contents)[0] && Contents == old(Contents)[1..];
{
assert a[m] == a[m..n][0];
d, m, Contents := a[m], m + 1, Contents[1..];
}





}

//method Main()
//{ var q := new SimpleQueue();
//q.Enqueue(5); q.Enqueue(12);
//var x := q.Dequeue();
//assert x = 5;
//}


class Schedule
{
var sched: SimpleQueue<int>;
var it_length: int;
var counter: int;

constructor(num_iterations:int)
 modifies this
 {
  sched := new SimpleQueue();
  it_length := num_iterations;
  counter := 0;
  var i := 0;
  while i < it_length
  {
   sched.Enqueue(1);
   i := i+1;
  }
}

method update()
 modifies this
{
 var temp := sched.Dequeue();
 counter := counter + 1;
}

method empt() returns (emp: bool){
 emp:= (counter == it_length);
}

}

