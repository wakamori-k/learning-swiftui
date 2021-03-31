//
//  Binding+Extension.swift
//  ToDoList
//
//  Created by 若森和昌 on 2021/03/31.
//

import SwiftUI

extension Binding {
    init<T>(isNotNil source: Binding<T?>, defaultValue: T) where Value == Bool {
        self.init(get: { source.wrappedValue != nil},
                  set: { source.wrappedValue = $0 ? defaultValue : nil })
    }
    
    init(_ source: Binding<Value?>, _ defaultValue: Value) {
        self.init(get: {
            if let value = source.wrappedValue {
                return value
            }
            return defaultValue
        }, set: {
            source.wrappedValue = $0
        })
    }
}
