//
//  MainFeature.swift
//  QuantMaster
//
//  Created by 진성준 on 9/20/24.
//

import Foundation
import ComposableArchitecture
import Combine


@Reducer
struct MainFeature {
    
    var service: MainServiceProtocol
    
    @ObservableState
    struct State {
        var conditions: QuantConditionsModel?
        var results: QuantResultModel?
        
        @Presents var alert: AlertState<Action.Alert>?
    }
    
    enum Action {
        case onAppear
        
        case fetchQuantConditions
        case quantConditionsResponse(QuantConditionsModel?)
        
        case fetchQuantResults
        case quantResultsResponse(QuantResultModel?)
        
        case alert(PresentationAction<Alert>)
        case showAlert
        
        @CasePathable
        enum Alert {
            case confirmTapped
        }
    }
    
    
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchQuantConditions:
                return .publisher {
                    self.service.fetchQuantConditions()
                        .map { .quantConditionsResponse($0) }
                        .catch { _ in Just(.quantConditionsResponse(nil)) }
                }
            case .quantConditionsResponse(let conditions):
                state.conditions = conditions
                return .none
                
            case .fetchQuantResults:
                guard let conditions = state.conditions else { return .send(.showAlert) }
                return .publisher {
                    self.service.fetchQuantResults(conditions: conditions)
                        .map { .quantResultsResponse($0) }
                        .catch { _ in Just(.quantResultsResponse(nil)) }
                }
            case .quantResultsResponse(let results):
                state.results = results
                return .none
                
            case .alert:
                return .none
            case .showAlert:
                state.alert = AlertState {
                    TextState("alert_check_conditions".localized)
                } actions: {
                    ButtonState(role: .destructive, label: {
                        TextState("alert_ok".localized)
                    })
                }
                return .none
                
            case .onAppear:
                
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}

protocol MainServiceProtocol {
    
    func fetchQuantConditions() -> AnyPublisher<QuantConditionsModel, Error>
    
    func fetchQuantResults(conditions: QuantConditionsModel) -> AnyPublisher<QuantResultModel, Error>
}

struct MainService: MainServiceProtocol {
    
    func fetchQuantConditions() -> AnyPublisher<QuantConditionsModel, Error> {
        return CommonClient.shared.sendGet(path: "")
    }
    
    func fetchQuantResults(conditions: QuantConditionsModel) -> AnyPublisher<QuantResultModel, Error> {
        return CommonClient.shared.sendGet(path: "")
    }
}

#if DEBUG
struct MainServiceTest: MainServiceProtocol {
    
    func fetchQuantConditions() -> AnyPublisher<QuantConditionsModel, any Error> {
        
        return TestPublisher(QuantConditionsModel(
            selectList: TestData.selectConditionModel,
            checkList: TestData.checkConditionModel)
        )
        .eraseToAnyPublisher()
    }
    
    func fetchQuantResults(conditions: QuantConditionsModel) -> AnyPublisher<QuantResultModel, any Error> {
        return TestPublisher(QuantResultModel(data: []))
            .eraseToAnyPublisher()
    }
}

#endif
