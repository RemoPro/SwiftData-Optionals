//
//  Bindings+Extensions.swift
//  SwiftData Categories
//
//  Created by Remo Prozzillo on 27.05.2025.
//

import SwiftUI

public extension Binding {
  /// Unwraps an optional binding and provides a default value if the wrapped value is `nil`.
  ///
  /// This can be useful when working with CloudKit, where models' properties must be optional or have a default value.
  /// Might be useful for other use cases as well.
  ///
  /// Example usage:
  /// ```swift
  /// struct MyView: View {
  ///   @State private var name: String? = nil
  ///
  ///   var body: some View {
  ///     TextField("Name", text: $name.withDefault(value: "Default Name"))
  ///       .padding()
  ///   }
  /// }
  /// ```
  /// - Parameter defaultValue: The value to use when the wrapped value is `nil`.
  /// - Returns: A non-optional `Binding`.
  func withDefault<Wrapped: Sendable>(value defaultValue: Wrapped) -> Binding<Wrapped> where Optional<Wrapped> == Value {
    Binding<Wrapped> {
      wrappedValue ?? defaultValue
    } set: { newValue in
      self.wrappedValue = newValue
    }
  }
}
