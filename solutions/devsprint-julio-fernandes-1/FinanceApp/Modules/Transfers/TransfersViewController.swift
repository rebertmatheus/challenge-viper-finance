//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class TransfersViewController: UIViewController {
	
	private var presenter: TransfersPresenterProtocol
	
	private lazy var transferView: TransfersView = {
		
		let transferView = TransfersView()
		transferView.delegate = self
		return transferView
	}()
	
	// MARK: - Init
	
	init(presenter: TransfersPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = transferView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewDidLoad()
	}
}

extension TransfersViewController: TransferViewDelegate {
	
	func didPressChooseContactButton() {
		presenter.navigateToContactList()
	}
	
	func didPressTransferButton() {
		presenter.navigateToConfirmation()
	}
}

extension TransfersViewController: TransfersPresenterDelegate {
    func showData(transfer: TransfersEntity) {
        //Show data in the controller
    }

    func showError(error: Error) {
        //Show error in the controller
    }
}
