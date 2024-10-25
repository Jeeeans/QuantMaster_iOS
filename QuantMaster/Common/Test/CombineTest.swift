//
//  CombineTest.swift
//  QuantMaster
//
//  Created by 진성준 on 10/22/24.
//

import Combine

public struct TestPublisher<Output>: Publisher {
    
    public typealias Failure = Error
    
    var output: Output
    
    init(_ output: Output) {
        self.output = output
    }
    
    
    public func receive<S>(subscriber: S) where S : Subscriber, any Failure == S.Failure, Output == S.Input {
        let subscription = TestSubscription(subscriber: subscriber, input: self.output)
        subscriber.receive(subscription: subscription)
    }
}

public class TestSubscription<Output, S: Subscriber>: Subscription where S.Input == Output,
                                                                  S.Failure == Error {
    var subscriber: S?
    var input: Output?
    
    init(subscriber: S, input: Output?) {
        self.subscriber = subscriber
        self.input = input
    }
    
    public func request(_ demand: Subscribers.Demand) {
        guard let input else { return }
        _ = subscriber?.receive(input)
    }
    
    public func cancel() {
        self.subscriber = nil
    }
    
    
}
