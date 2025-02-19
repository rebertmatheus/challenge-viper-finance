//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 03/02/22.
//

import Foundation

protocol TransfersInteractorDelegate: AnyObject {
    func didFetchData(transfer: TransfersEntity)
    func didReceiveError(error: Error)
}

final class TransfersInteractor: TransfersInteractorProtocol {
    weak var presenter: TransfersInteractorDelegate?
    private let service: FinanceServiceProtocol

    init(service: FinanceServiceProtocol) {
        self.service = service
    }

    func fetchData() {
        service.load(endpoint: .transfer) { [weak self] (result: Result<TransfersEntity, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let transfer):
                self.presenter?.didFetchData(transfer: transfer)
            case .failure(let error):
                self.presenter?.didReceiveError(error: error)
            }
        }
    }
}
