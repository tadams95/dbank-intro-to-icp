import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  //the stable key word makes this variable have orthogonal persistence.
  //a variable keeps its state even after a refresh or redeploy
  stable var currentValue: Float =  300;
  currentValue := 300;

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 9841646494;

  //function to deposit funds to dbank
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //function to withdraw funds from dbank
   public func withdraw(amount: Float) {
    //assigning value Integer data type from Natural data type for code functionality.
    let tempValue: Float = currentValue - amount;
    //if statement to catch any withdrawals that would bring account negative. (Not allowed)
    if (tempValue - amount >= 0) {
      currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.")
    }
    
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };


  // topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    //1 Billion nano seconds in 1 second
    let timeElapsedSeconds = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedSeconds));
    //reset startTime to whatever value is the current time. Compound from the previous time the amount earned compound interest
    startTime := currentTime;
  }
}