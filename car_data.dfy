class MachineData
{
var car_length: int
var x: int;
var y: int;
var theta: int;
var configuration: seq<int>;
var speed: int;
var steering: int;

constructor(x_in: int, y_in: int, theta_in: int, speed_in: int, steering_in: int, length_in: int)
 modifies this
 {
  x := x_in;
  y := y_in;
  theta := theta_in;
  configuration:= [x, y, theta];
  speed := speed_in;
  steering := steering_in;
  car_length := length_in;
 }

method update(x_in: int, y_in: int, theta_in: int, speed_in: int, steering_in: int)
modifies this
{
x := x_in;
y := y_in;
theta := theta_in;
configuration:= [x, y, theta];
speed := speed_in;
steering := steering_in;

//in the future, can add formulas to update x, y, and theta based on the speed and steering angle
}

}


class UserData
{
var driver_alert: bool;
var machinery_input: seq<int>;
var self_drive_req: bool;

constructor(alert_in: bool, self_drive_in: bool)
modifies this
{
driver_alert := alert_in;
self_drive_req := self_drive_in;
machinery_input:= [0, 0];
}

method setMachinery(speed: int, steering: int)
modifies this
{
machinery_input := [speed, steering];
}

method getSpeed() returns (s:int)
{
if |machinery_input| != 0{s:= machinery_input[0];}
else {s:=0;}
}
method getSteering() returns (st:int)
{
if |machinery_input| > 1{st:= machinery_input[1];}
else {st:=0;}
}


}

class RoadState{
var state:bool;
}

class CarState
{
var machine_data: MachineData;
var display: bool;
var road_state: RoadState;
var user_info: UserData;
var car_on: bool;
var self_driving: bool;
//Eventually make own objects to replace bools.

constructor(init_road_state: RoadState, init_user_info: UserData, init_machine_data: MachineData)
 modifies this
 {
  display, car_on := true, true;
  machine_data := init_machine_data;
  road_state := init_road_state;
  user_info := init_user_info;
  self_driving := false;
 //make mode dependent on user_input and driver_state
 }

//not sure if getters are necessary

method setMachineData(new_machine_data: MachineData)
 modifies this
 {
  machine_data := new_machine_data;
 }


method setDisplay(new_display: bool)
 modifies this
 {
  display := new_display;
 }

method setRoadState(new_road_state: RoadState)
 modifies this
 {
  road_state := new_road_state;
 }

method setUserInfo(new_user_info: UserData)
 modifies this
 {
  user_info := new_user_info;
 }

method setCarOn(new_car_on: bool)
 modifies this
 {
  car_on := new_car_on;
 }

method setSelfDriving(new_self_driving: bool)
 modifies this
 {
  self_driving := new_self_driving;
 }


}
