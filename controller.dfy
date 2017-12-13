  include "car_data.dfy"
include "scheduler.dfy"

method main(){
var user_state := new UserData(true, false); //user is alert and does not want the car in self driving mode
 user_state.setMachinery(0,0);
 var speed := user_state.getSpeed();
 var steering := user_state.getSteering();
 var machine_data := new MachineData(0,0,0,speed, steering, 6);
 var car := new CarState(true, user_state, machine_data);
 var num_iterations := 10;
 //var schedule := new Schedule(num_iterations);
 //var empty := schedule.empt();
var i := 0;
 while i < num_iterations
 {
if (user_state.self_drive_req == true){car := SelfDrive(car);}
else {car := UserDrive(car);}
i:= i+1;

 }


}


method SelfDrive(old_state: CarState) returns (new_state: CarState)

{
if old_state!= null{var user_input := old_state.user_info;}
//define newCarState method else {old_state := newCarState()}
//driving decisions based on road and goal state
//user ask for control?
//display says self-driving is "on"
new_state := old_state;
}


method UserDrive(old_state: CarState) returns (new_state: CarState)

{

//predicted driver behavior
//send human inputs to machine
//display says self-driving is "off"
new_state := old_state;
}
