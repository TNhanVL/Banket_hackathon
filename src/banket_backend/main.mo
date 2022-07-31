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
      FirstName : Text;
      LastName: Text;
      Birthday : Text;
      Phone : Text;
      Address: Text;
      Sex : Bool;
  };

  var next : Nat = 0;
    
  // stable var entries : [( Principal, Person)] = [];

  var customers : Trie.Trie<Nat, Person> = Trie.empty();
  
  private func key(x : Nat) : Trie.Key<Nat>{
    return{
      key = x;
      hash = Hash.hash(x);
    };
  };

  // type FavorResult = {#ok : Text; #dup : Text};
  // type FavorResult<T,E> = Result.Result<T, E>;

  // Function 1:  Read Account function
    
  // public query func read_Account(principal : Principal) : async Nat {
  //   let result = Trie.toArray(customers);
  //   return result;
  // };

  // Function 2: Create Account
  public shared(caller) func createAccount ( FirstName : Text, LastName : Text, Birthday : Text, Phone : Text, Address: Text, Sex : Bool ) : async Bool {
    next += 1;
    var person: Person = {
      FirstName = FirstName;
      LastName = LastName;
      Birthday = Birthday;
      Phone = Phone;
      Address = Address;
      Sex = Sex;
    };
    let (newPersons, existing) = Trie.put(
      customers,
      key(next),
      Nat.equal,
      person
    );
    switch(existing) {
      // if there is no match
      case (null) {
         customers := newPersons;
      };
      // Match
      case(?v) {
        return false;
      };
    };
    return true;
  };

  // Function 3: Update Account function
  public shared(caller) func updateAccount ( id : Nat, FirstName : Text, LastName : Text, Birthday : Text, Phone : Text, Address: Text, Sex : Bool ) : async Bool {
    let result = Trie.find(
      customers,key(id),Nat.equal
    );
    switch(result) {
      // Not update
      case (null) {
        return false;
      };
      case (?v) {
        var person: Person = {
          FirstName = FirstName;
          LastName = LastName;
          Birthday = Birthday;
          Phone = Phone;
          Address = Address;
          Sex = Sex;
        };
        customers := Trie.replace(
          customers,key(id),Nat.equal,?person
        ).0;
      };  
    };
    return true;
  };

  //delete
  public shared(caller) func deleteAccount ( id : Nat ) : async Bool {
    next += 1;
    var person: Person = {
      FirstName = FirstName;
      LastName = LastName;
      Birthday = Birthday;
      Phone = Phone;
      Address = Address;
      Sex = Sex;
    };
    let (newPersons, existing) = Trie.put(
      customers,
      key(next),
      Nat.equal,
      person
    );
    switch(existing) {
      // if there is no match
      case (null) {
         customers := newPersons;
      };
      // Match
      case(?v) {
        return false;
      };
    };
    return true;
  };
}