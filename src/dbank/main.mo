import Debug "mo:base/Debug";

actor DBank {
  var currentValue =  300;
  currentValue := 100;

  let id = 9841646494;

  //function to deposit funds to dbank
  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //function to withdraw funds from dbank
   public func withdraw(amount: Nat) {
    //assigning value Integer data type from Natural data type for code functionality.
    let tempValue: Int = currentValue - amount;
    //if statement to catch any withdrawals that would bring account negative. (Not allowed)
    if (tempValue - amount >= 0) {
      currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.")
    }
    
  };


  // topUp();
  // Debug.print(debug_show(id));
}