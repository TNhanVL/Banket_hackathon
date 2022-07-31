import Text "mo:base/Text";
import Nat "mo:base/Nat";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Trie "mo:base/Trie";
import List "mo:base/List";
import Result "mo:base/Result";
import Principal "mo:base/Principal";
import Iter "mo:base/Iter";

import Person "Person"

// import Debug "mo:base/Debug";
// import HTTP "http";

// import Time "mo:base/Time";

actor {
  public type Person = {
      ID : Nat;
      Name : Text;
      Birthday : Text;
      Phone : Text;
      Sex : Bool;
  };
    
  // stable var entries : [( Principal, Person)] = [];

  var customers = HashMap.HashMap<Principal, Person>(0, Principal.equal, Principal.hash);
  
  // type FavorResult = {#ok : Text; #dup : Text};
  // type FavorResult<T,E> = Result.Result<T, E>;

  // Function 1:  Read Account function
  // public query func read_Account(principal : Principal) : async ?Person {
  //       return(customers.get(principal));
  // };

  // Function 2: Create Account
  // public shared(caller) func createAccount ( ID : Nat, Name : Text, Birthday : Text, Phone : Text, Sex : Bool ) : async () {
  //   var person: Person = {
  //     ID = ID;
  //     Name = Name;
  //     Birthday = Birthday;
  //     Phone = Phone;
  //     Sex = Sex;
  //   };
  //   switch (customers.get(caller.caller)) {
  //     case null {
  //       customers.put(caller.caller, person);
  //     };
  //   };
  // };

  // Function 3: Update Account function

}