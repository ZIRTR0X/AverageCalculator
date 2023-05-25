//
// Created by etudiant on 25/05/2023.
//

import Foundation
 public struct Grade {
     private var _id: Int;
     public var id: Int {
         get {_id;}
         set {_id = newValue;}
     }

     private var _name: String;
     public var name: String {
         get {_name;}
         set {_name = newValue;}
     }

     private var _value: Int;
     public var value: Int {
         get {_value;}
         set {_value = newValue;}
     }

     private var _coef: Int;
     public var coef: Int {
         get {_coef;}
         set {_coef = newValue;}
     }
 }